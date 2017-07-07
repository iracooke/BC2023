#!/usr/bin/env python3

import argparse
import sys
import string

# This is the translation code for bacteria and archaea
# It is the same as the standard code
#
translation_code = {
'TTT':'F', 'TCT':'S', 'TAT':'Y', 'TGT':'C',
'TTC':'F', 'TCC':'S', 'TAC':'Y', 'TGC':'C',
'TTA':'L', 'TCA':'S', 'TAA':'*', 'TGA':'*',
'TTG':'L', 'TCG':'S', 'TAG':'*', 'TGG':'W',
'CTT':'L', 'CCT':'P', 'CAT':'H', 'CGT':'R',
'CTC':'L', 'CCC':'P', 'CAC':'H', 'CGC':'R',
'CTA':'L', 'CCA':'P', 'CAA':'Q', 'CGA':'R',
'CTG':'L', 'CCG':'P', 'CAG':'Q', 'CGG':'R',
'ATT':'I', 'ACT':'T', 'AAT':'N', 'AGT':'S',
'ATC':'I', 'ACC':'T', 'AAC':'N', 'AGC':'S',
'ATA':'I', 'ACA':'T', 'AAA':'K', 'AGA':'R',
'ATG':'M', 'ACG':'T', 'AAG':'K', 'AGG':'R',
'GTT':'V', 'GCT':'A', 'GAT':'D', 'GGT':'G',
'GTC':'V', 'GCC':'A', 'GAC':'D', 'GGC':'G',
'GTA':'V', 'GCA':'A', 'GAA':'E', 'GGA':'G',
'GTG':'V', 'GCG':'A', 'GAG':'E', 'GGG':'G'	
}

def parse_fasta_header( header ):
	# import pdb; pdb.set_trace();
	sh = header.split(None,1)
	accession,description = sh if len(sh) == 2 else [sh[0],""]
	return accession[1:],description

# Given a file pointer to a FASTA file
# reads it entry by entry.
# 
def read_fasta( fp ):
	accession, description, seq = None,None, []
	for line in fp:
		line = line.rstrip()
		if line.startswith(">"):
			if accession: yield (accession, description, ''.join(seq))
			accession, description = parse_fasta_header( line )
			seq = []
		else:
			seq.append(line)
	if accession: yield (accession, description, ''.join(seq))

def reverse_complement( dnasequence ):
	trans = str.maketrans('ATGC', 'TACG')
	return dnasequence[::-1].translate(trans)

def dna2aa( sequence , code, frame ):
	coding_sequence = sequence if frame > 0 else reverse_complement(sequence)
	# import pdb; pdb.set_trace();
	coding_sequence = coding_sequence[abs(frame)-1:]
	return ''.join([ code.get(coding_sequence[3*i:3*i+3],'X') for i in range(len(coding_sequence)//3) ])

def get_orfs(translated_seq,na_seq,frame,parent_accession):
	start=abs(frame)-1 if frame > 0 else len(na_seq) - abs(frame) + 1
	N=0
	for orf in translated_seq.split("*"):
		if frame > 0:
			os = start
			oe = start+len(orf)*3
			start = oe+3
		else: 
			os = start-len(orf)*3
			oe = start
			start = os-3

		N=N+1
		strand = lambda x: ("+", "-")[x < 0]
		yield { 'parent':parent_accession, 'start':os , 'end':oe , 'strand':strand(frame), 'frame':frame,
		'orfnum': N,'length':len(orf), 'seq': orf}

def print_fasta(name,seq,n=80):
	sys.stdout.write(">"+name+"\n")
	for i in range(0, len(seq), n):
		sys.stdout.write(seq[i:i+n]+"\n")

direction = lambda x: ("f", "r")[x < 0]

def print_translated_seq(seq,frame,of,accession):
	fasta_id = "_".join([accession,direction(frame),str(abs(frame))])
	if of=='tabular':
		sys.stdout.write("\t".join([accession,str(frame),str(len(seq)),seq])+"\n")
	else:
		print_fasta(fasta_id,seq)

def print_orf(orf,of):
	if of=='tabular':
		column_keys = ['parent','start','end','strand','orfnum','length','seq']
		sys.stdout.write("\t".join(str(value) for value in [orf[x] for x in column_keys])+"\n")
	else:
		orf_fasta_id = "_".join([orf['parent'],str(orf['orfnum']),direction(orf['frame']),str(abs(orf['frame']))])
		print_fasta(orf_fasta_id,orf['seq'])

def translate_frame(seq,accession,translation_code,frame,of,split):
	translated_seq = dna2aa(seq,translation_code,frame)

	if split:
		for orf in get_orfs(translated_seq,seq,frame,accession):
			print_orf(orf,of)
	else:
		print_translated_seq(translated_seq,frame,of,accession)


# Command line arguments
#
parser = argparse.ArgumentParser(description='Translate DNA to Protein')

parser.add_argument('infasta',metavar='FILE',nargs='?',type=argparse.FileType('r'),
	help='DNA sequences in FASTA format',default=sys.stdin)

parser.add_argument('-f','--frame',type=int,choices = [0,1,2,3,-1,-2,-3],
	help='Translation Frame.',default=1)

parser.add_argument('-F','--format',type=str,choices = ['fasta','tabular'],
	help='Output format.',default='fasta')

parser.add_argument('-s','--split',action="store_true", help='Split into separate sequences separated by stop codons')

args  = parser.parse_args()

for accession, description, seq in read_fasta(args.infasta):
	frames = [args.frame] if args.frame != 0 else [1,2,3,-1,-2,-3]
	for frame in frames:
		translate_frame(seq,accession,translation_code,frame,args.format,args.split)

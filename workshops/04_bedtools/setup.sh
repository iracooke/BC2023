NOTEBOOK_HOME="${NOTEBOOK_HOME:-`pwd`}"
export NOTEBOOK_HOME

export PATH=${PATH}:.

display_answer(){
    test_answer=$1
    reference_answer=$2
    if [ "${test_answer}" == "${reference_answer}" ]; then
        echo "Your answer is correct"
        return 0
    else
        echo "Answer is incorrect"
        echo "Got     : ${test_answer}" 
        echo "Expected: ${reference_answer}"
        return 1
    fi
}

display_answer_diff(){
    diff_result=$1
    if [ "${diff_result}" == "" ]; then
        echo "Your answer is correct"
        return 0
    else
        echo "Answer is incorrect"
        echo "Differences between your output file and expected output are shown below"
        echo "${diff_result}"
        return 1
    fi
}

check_dir(){
    if [[ ${NOTEBOOK_HOME} != $(pwd) ]]; then
        echo "Your working directory seems to have changed. Did you use the cd command?"
        echo "Restart your kernel and then rerun the setup code to fix"
        return 1
    else
        return 0
    fi
}


# Defines a helper function for testing answers
test_answer(){
    n=$1
    e="$n"
    test_answer="$(eval e$1_answer)"
    reference_answer=$2
    if [[ check_dir == 1 ]]; then
        check_dir
    else
        display_answer "$test_answer" "$reference_answer"
    fi
}

test_answer_file(){
    n=$1

    if [[ check_dir == 1 ]]; then
        check_dir
    else
        if [[ check_file == 1 ]]; then
            check_file
        else
            display_answer_diff "${2}"
        fi
    fi
}


ensure_long_orfs_tabular(){
    translate.py -f 0 --split -F 'tabular' genomic_sequence.fasta\
     | sort -n -k 6 | tail -n 100 | grep 'M' > long_orfs.tabular
}

ensure_long_orfs_bed(){
    awk '{print $1,$2,$3,$5,$6,$4}' \
    <(translate.py -f 0 --split -F 'tabular' genomic_sequence.fasta \
    | sort -n -k 6 | tail -n 100 | grep 'M') | tr ' ' '\t' > long_orfs.bed
}


test_e1(){
    e1_answer
    test_answer_file 1 "$(diff long_orfs.tabular \
    <(translate.py -f 0 --split -F 'tabular' genomic_sequence.fasta\
     | sort -n -k 6 | tail -n 100 | grep 'M') )"
}


test_e2(){
    ensure_long_orfs_tabular
    test_answer 2 "$(awk '{print $1,$2,$3,$5,$6,$4}' long_orfs.tabular | head)"
}


test_e3(){
    ensure_long_orfs_tabular
    e3_answer
    test_answer_file 3 "$(diff long_orfs.bed \
    <(awk '{print $1,$2,$3,$5,$6,$4}' long_orfs.tabular | tr ' ' '\t' ))"
}

test_e4(){
    ensure_long_orfs_bed
    test_answer 4 "$(bedtools intersect -wa -a long_orfs.bed -b mutant.bed)"
}

test_e5(){
    ensure_long_orfs_bed
    test_answer 5 "$(bedtools intersect -wa -a long_orfs.bed -b mutant.bed | grep '-')"
}

test_e6(){
    ensure_long_orfs_bed

    bedtools intersect -wa -a long_orfs.bed -b mutant.bed | grep '-' > long_orfs_overlapping_neg.bed

    bedtools intersect -wa -a long_orfs.bed -b mutant.bed | grep '+' > long_orfs_overlapping_pos.bed
    
    test_answer 6 "$(bedtools getfasta -fi genomic_sequence.fasta -bed long_orfs_overlapping_neg.bed | translate.py -f -1)"
}

echo "Setup Done"
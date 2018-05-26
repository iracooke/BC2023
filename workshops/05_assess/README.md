Convert from gff to bed

```bash
cat h_pylori.gff | awk -F '\t' 'BEGIN{OFS="\t"}$3=="CDS"{print $1,$4,$5,$6,$7,$8,$9}' | sed -E 's/(.*)ID=.*Parent=([^;]+).*/\1\2/' | awk 'OFS="\t"{print $1,$2,$3,$7,$6,$5}' > h_pylori.bed
```
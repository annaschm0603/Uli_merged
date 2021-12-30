###on the command line for colors
for i in *.gz; do echo ${i%.*};  plotProfile -m ${i} -out ${i%.*}.png --perGroup --colors "#F18C3A" "#25897E"; done

###iswi and iswi
for i in iswi_*.gz; do echo ${i%.*};  plotProfile -m ${i} -out ${i%.*}.png --perGroup --colors "#65D6C9" "#1F766C"; done

###wt and wt
for i in wt_*.gz; do echo ${i%.*};  plotProfile -m ${i} -out ${i%.*}.png --perGroup --colors "#F18C3A" "#A04E0B"; done

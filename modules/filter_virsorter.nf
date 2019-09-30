process filter_virsorter {
      publishDir "${params.output}/${name}/virsorter", mode: 'copy', pattern: "virsorter.txt"
      label 'ubuntu'
    input:
      set val(name), file(results) 
    output:
      set val(name), file("virsorter.txt")
    shell:
      """
      cat !{results}/Predicted_viral_sequences/VIRSorter_cat-[1,2].fasta | grep ">" | sed -e s/\\>VIRSorter_//g | sed -e s/-cat_1//g |  sed -e s/-cat_2//g | cut -f1 -d "_" > virsorter.txt
      """
}
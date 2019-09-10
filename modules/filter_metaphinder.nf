process filter_metaphinder {
      publishDir "${params.output}/${name}/metaphinder", mode: 'copy', pattern: "metaphinder.txt"
      label 'ubuntu'
    input:
      set val(name), file(results) 
    output:
      set val(name), file("metaphinder.txt")
    shell:
      """
      export LC_NUMERIC=en_US.utf-8
      sort  -g  -k4,4 !{results} | awk '\$2>=phage' | awk '{ print \$1 }' | tail -n+2 > metaphinder.txt
      """
}
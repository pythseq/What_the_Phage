process filter_virfinder {
      label 'ubuntu'
    input:
      tuple val(name), file(results) 
    output:
      tuple val(name), file("virfinder_*.txt")
    script:
      """
      tail -q -n+2 *.list | awk '\$4>=${params.vf_filter}' | awk '{ print \$2 }' > virfinder_\${PWD##*/}.txt
      """
}
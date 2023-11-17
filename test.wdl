version 1.0

task bamstats {
    input {
        File bam_input
        Int mem_gb
    }

    command {
        /usr/local/bin/bamstats ${mem_gb} ${bam_input}
    }

    output {
        File bamstats_report = "bamstats_report.zip"
    }

    runtime {
        docker: "quay.io/collaboratory/dockstore-tool-bamstats:1.25-6_1.0"
        memory: mem_gb + "GB"
    }
}

workflow bamstatsWorkflow {
    input {
        File bam_input
        Int mem_gb
    }
  parameter_meta {
    bam_input: {
      help: "Input file"
    }
    mem_gb: { 
      help: "Memory",
      suggestions: [8,16]
    }
  }
    call bamstats { input: bam_input=bam_input, mem_gb=mem_gb }

    meta {
        author: "Andrew Duncan"
        email: "andrew@foobar.com"
        description: "## Bamstats \n This is the Bamstats workflow.\n Dont run me, I contain a bug\n Adding documentation improves clarity. \nOne of the most intersting workflows here"
    }
}

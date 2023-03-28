locals { 
  default = timestamp()
}

output "time" { 
  value = local.default
}
 

locals { 
  time = formatdate("DD MMM YYYY hh:mm ZZZ", timestamp())
}

output "time2" { 
  value = local.time
}
 


locals { 
 file = fileexists("${path.module}/hello.txt")
}

output "file-test-1" { 
  value = local.file
}

/*
locals { 
 file-2 = file("${path.module}/hello.txt")
}

output "file-test-2" { 
  value = local.file-2
}
*/




locals { 
 filecondition = fileexists("${path.module}/hello.txt") ? file("${path.module}/hello.txt") : local.default_msg
}

locals { 
  default_msg = "No file found, please make sure file exists.!!"
}

output "testcondition" { 
  value = local.filecondition
}

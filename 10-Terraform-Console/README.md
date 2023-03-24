```
# terraform console
> 2 + 4
6
> 10 - 7
3
> 5 * 2
10
> 5 * 3
15
> 30 / 5
6
>

>

> contains(tolist(["orange", "mango", "apple"]), "kiwi")
false
> contains(tolist(["orange", "mango", "apple"]), "apple")
true
> length("a,b,c")
5


> length(split(",", "a,b,c") )
3
> length(tomap({"key"="val"}))
1
>

>

> merge(tomap({"key"="val"}), tomap({"test"="abc"}))
tomap({
  "key" = "val"
  "test" = "abc"
})
>

>

> max(5, 15, 19)
19
> min(5, 15, 19)
5
>

>


> formatdate("DD MMM YYYY hh:mm ZZZ", "2022-01-27T20:12:01Z")
"27 Jan 2022 20:12 UTC"
> formatdate("MMM DD YYYY hh:mm ZZZ", "2022-01-27T20:12:01Z")
"Jan 27 2022 20:12 UTC"
> formatdate("YYYY MMM DD hh:mm ZZZ", "2022-01-27T20:12:01Z")
"2022 Jan 27 20:12 UTC"
> formatdate("hh:mm ZZZ", "2022-01-27T20:12:01Z")
"20:12 UTC"
> formatdate("hh:mmaa", "2022-01-27T20:12:01Z")
"20:12pm"
> timeadd("2022-01-27T20:12:01Z" , "30m")
"2022-01-27T20:42:01Z"
> timeadd("2022-01-27T20:12:01Z" , "10m")
"2022-01-27T20:22:01Z"
>

> lookup({a="Hello Terraform", b="How are you Terraform"}, "a", "Please use the right key")
"Hello Terraform"
> lookup({a="Hello Terraform", b="How are you Terraform"}, "b", "Please use the right key")
"How are you Terraform"
> lookup({a="Hello Terraform", b="How are you Terraform"}, "c", "Please use the right key")
"Please use the right key"
> lookup({a="Hello Terraform", b="How are you Terraform"}, "0", "Please use the right key")
"Please use the right key"
> lookup({a="Hello Terraform", b="How are you Terraform"}, "100", "Please use the right key")
"Please use the right key"
>

>

> join(",", ["apple", "mango", "cherry"] )
"apple,mango,cherry"
> join("-", ["apple", "mango", "cherry"] )
"apple-mango-cherry"
>



> lower("WELCOME")
"welcome"
> upper("amit")
"AMIT"
>


> replace("1 + 2 + 5", "+" , "-")
"1 - 2 - 5"
> replace("Welcome to the terraform", "the" , "the world of")
"Welcome to the world of terraform"
>


> base64encode("Welcome to the world of terraform")
"V2VsY29tZSB0byB0aGUgd29ybGQgb2YgdGVycmFmb3Jt"
> base64decode("V2VsY29tZSB0byB0aGUgd29ybGQgb2YgdGVycmFmb3Jt")
"Welcome to the world of terraform"
> exit
```


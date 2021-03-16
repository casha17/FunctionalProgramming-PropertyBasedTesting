open QCheck

let t = Test.make ~name:"my_test" small_signed_int (fun _ -> false);;

QCheck_runner.run_tests [t];;
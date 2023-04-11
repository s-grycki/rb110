# Given the Munsters hash, modify the hash so each family member has an
# additional age_group key that describes each as kid, adult, or senior
# kid: 0-17, adult: 18-64, senior: 65+

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}


munsters.each do |key, _|
  age = case
  when munsters[key]["age"] <= 17 then age = "kid"
  when munsters[key]["age"] <= 64 then age = "adult"
  when munsters[key]["age"] >= 65 then age = "senior"
  end
  munsters[key]["age_group"] = age
end

p munsters
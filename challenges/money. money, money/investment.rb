def calculate_years(principal, interest, tax, desired)
  
  return 0 if desired < principal
  
  year = 0 
  
  while(principal < desired)
    annual_int = interest * principal
    year +=1
    principal += (annual_int - (annual_int*tax))
  end
  
  return year
end
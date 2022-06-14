Create table annual_number_of_deaths_by_cause
(
  Entity VARCHAR(50),
  Code VARCHAR(50),
  Year int,
  Number_of_executions VARCHAR(50),
  Meningitis VARCHAR(50),
  Alzheimers_disease VARCHAR(50),
  Parkinsons_disease VARCHAR(50),
  Nutritional_deficiencies VARCHAR(50),
  Malaria VARCHAR(50),
  Drowning VARCHAR(50),
  Interpersonal_violence VARCHAR(50),
  Maternal_disorders VARCHAR(50),
  HIV_AIDS VARCHAR(50),
  Drug_use_disorders VARCHAR(50),
  Tuberculosis VARCHAR(50),
  Cardiovascular_diseases VARCHAR(50),
  Lower_respiratory_infections VARCHAR(50),
  Neonatal_disorders VARCHAR(50),
  Alcohol_use_disorders VARCHAR(50),  
  Self_harm VARCHAR(50),
  Exposure_to_forces_of_nature VARCHAR(50),
  Diarrheal_diseases VARCHAR(50),
  Environmental_heat_and_cold_exposure VARCHAR(50),
  Neoplasms VARCHAR(50),  
  Conflict_and_terrorism VARCHAR(50),
  Diabetes_mellitus VARCHAR(50),  
  Chronic_kidney_disease VARCHAR(50),  
  Poisonings VARCHAR(50),  
  Protein_energy_malnutrition VARCHAR(50),  
  Terrorism VARCHAR(50),  
  Road_injuries VARCHAR(50),  
  Chronic_respiratory_diseases VARCHAR(50),
  Cirrhosis_and_other_chronic_liver_diseases VARCHAR(50),
  Digestive_diseases VARCHAR(50),  
  Fire_heat_and_hot_substances VARCHAR(50),  
  Acute_hepatitis VARCHAR(50)
);

Create table c02_emission
(
Entity VARCHAR(50),
  Code VARCHAR(50),
  Year VARCHAR(50),
  Annual_CO2_emissions_tonnes VARCHAR(50)
);
Create table death_rate_from_cancers_vs_average_income
(
Entity VARCHAR(50),
  Code VARCHAR(50),
  Year VARCHAR(50),
  Death_rate VARCHAR(50),
  GDP VARCHAR(50),
  Population VARCHAR(50),
  Continent VARCHAR(50)

);
Create table sales_of_cigarettes_per_adult_per_day
(
Entity  VARCHAR(50),
  Code  VARCHAR(50),
  Year  VARCHAR(50),
  Sales_of_cigarettes_per_adult_per_day VARCHAR(50)
);

LOAD DATA INFILE 'annual-number-of-deaths-by-cause (1)' INTO TABLE annual_number_of_deaths_by_cause; 


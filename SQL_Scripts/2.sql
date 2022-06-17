DELETE FROM annual_number_of_deaths_by_cause2
WHERE all_death = 0;




ALTER TABLE annual_number_of_deaths_by_cause2 ADD COLUMN id SERIAL PRIMARY KEY;


ALTER TABLE death_rate_from_cancers_vs_average_income ADD COLUMN id SERIAL PRIMARY KEY;


ALTER TABLE c02_emission ADD COLUMN id SERIAL PRIMARY KEY;


ALTER TABLE sales_of_cigarettes_per_adult_per_day ADD COLUMN id SERIAL PRIMARY KEY;










SELECT annual_number_of_deaths_by_cause2.entity,
annual_number_of_deaths_by_cause2.code,annual_number_of_deaths_by_cause2.year,
annual_number_of_deaths_by_cause2.all_death,
annual_number_of_deaths_by_cause2.Neoplasms,annual_number_of_deaths_by_cause2.ratio,
Death_rate,
GDP,Population,Sales_of_cigarettes_per_adult_per_day,Annual_CO2_emissions_tonnes FROM annual_number_of_deaths_by_cause2  JOIN death_rate_from_cancers_vs_average_income 
ON (annual_number_of_deaths_by_cause2.code=death_rate_from_cancers_vs_average_income.code
        AND annual_number_of_deaths_by_cause2.year=death_rate_from_cancers_vs_average_income.year)
        join sales_of_cigarettes_per_adult_per_day on 
        (annual_number_of_deaths_by_cause2.code=sales_of_cigarettes_per_adult_per_day.code
        AND annual_number_of_deaths_by_cause2.year=sales_of_cigarettes_per_adult_per_day.year)
        join c02_emission on 
        (annual_number_of_deaths_by_cause2.code=c02_emission.code
        AND annual_number_of_deaths_by_cause2.year=c02_emission.year)














CREATE VIEW Final_table AS
   SELECT annual_number_of_deaths_by_cause2.entity,
annual_number_of_deaths_by_cause2.code,annual_number_of_deaths_by_cause2.year,
annual_number_of_deaths_by_cause2.all_death,
annual_number_of_deaths_by_cause2.Neoplasms,annual_number_of_deaths_by_cause2.ratio,
Death_rate,
GDP,Population,Sales_of_cigarettes_per_adult_per_day,Annual_CO2_emissions_tonnes FROM annual_number_of_deaths_by_cause2  JOIN death_rate_from_cancers_vs_average_income 
ON (annual_number_of_deaths_by_cause2.code=death_rate_from_cancers_vs_average_income.code
        AND annual_number_of_deaths_by_cause2.year=death_rate_from_cancers_vs_average_income.year)
        join sales_of_cigarettes_per_adult_per_day on 
        (annual_number_of_deaths_by_cause2.code=sales_of_cigarettes_per_adult_per_day.code
        AND annual_number_of_deaths_by_cause2.year=sales_of_cigarettes_per_adult_per_day.year)
        join c02_emission on 
        (annual_number_of_deaths_by_cause2.code=c02_emission.code
        AND annual_number_of_deaths_by_cause2.year=c02_emission.year)








CREATE TABLE year (
year_id SERIAL PRIMARY KEY,
        year int not null
);


Import dates


CREATE OR REPLACE FUNCTION import_year() RETURNS integer
LANGUAGE plpgsql
as $$
declare
i integer:=0;
total integer:=0;
curr_year integer;
begin
select count(*) into total from (select distinct year from annual_number_of_deaths_by_cause2) as qwert;
while i < total LOOP
select year into curr_year from (select distinct year from annual_number_of_deaths_by_cause2 limit 1 offset i) as qwert;
if  (not exists(select year from year where year.year=curr_year)) and curr_year is not NULL then
  insert into year (year) values (curr_year);
end if;
i:=i+1;
END LOOP;
return 1;
END;
$$;


select import_year()








CREATE OR REPLACE FUNCTION import_year_from_sales() RETURNS integer
LANGUAGE plpgsql
as $$
declare
i integer:=0;
total integer:=0;
curr_year integer;
begin
select count(*) into total from (select distinct year from sales_of_cigarettes_per_adult_per_day ) as qwert;
while i < total LOOP
select year into curr_year from (select distinct year from sales_of_cigarettes_per_adult_per_day  limit 1 offset i) as qwert;
if  (not exists(select year from year where year.year=curr_year)) and curr_year is not NULL then
  insert into year (year) values (curr_year);
end if;
i:=i+1;
END LOOP;
return 1;
END;
$$;


select import_year_from_sales()








CREATE OR REPLACE FUNCTION import_year_from_co2() RETURNS integer
LANGUAGE plpgsql
as $$
declare
i integer:=0;
total integer:=0;
curr_year integer;
begin
select count(*) into total from (select distinct year from c02_emission ) as qwert;
while i < total LOOP
select year into curr_year from (select distinct year from c02_emission  limit 1 offset i) as qwert;
if  (not exists(select year from year where year.year=curr_year)) and curr_year is not NULL then
  insert into year (year) values (curr_year);
end if;
i:=i+1;
END LOOP;
return 1;
END;
$$;


select import_year_from_co2()






CREATE OR REPLACE FUNCTION import_year_from_death_rate() RETURNS integer
LANGUAGE plpgsql
as $$
declare
i integer:=0;
total integer:=0;
curr_year integer;
begin
select count(*) into total from (select distinct year from death_rate_from_cancers_vs_average_income ) as qwert;
while i < total LOOP
select year into curr_year from (select distinct year from death_rate_from_cancers_vs_average_income  limit 1 offset i) as qwert;
if  (not exists(select year from year where year.year=curr_year)) and curr_year is not NULL then
  insert into year (year) values (curr_year);
end if;
i:=i+1;
END LOOP;
return 1;
END;
$$;


select import_year_from_death_rate()














set id


ALTER TABLE annual_number_of_deaths_by_cause2
 ADD year_id integer




CREATE OR REPLACE FUNCTION import_year_id_to_annualnumb() RETURNS integer
LANGUAGE plpgsql
as $$
declare
i integer:=0;
total integer:=0;
year_ integer;
year_id_ integer:=0;


begin
select count(*) into total from (select distinct year from annual_number_of_deaths_by_cause2) as qwert;
while i < total LOOP
select year into        year_ from (select distinct year from annual_number_of_deaths_by_cause2 limit 1 offset i) as qwert;
raise notice 'year_ % ',year_;
select year_id into year_id_ from (select  year_id from year where year=year_ ) as qwert;
        raise notice 'year_id_ %',year_id_;                                                                                                                                                           
UPDATE annual_number_of_deaths_by_cause2 SET year_id = year_id_ where year =year_;
i:=i+1;
END LOOP;
return 1;
END;
$$;


select import_year_id_to_annualnumb()




ALTER TABLE sales_of_cigarettes_per_adult_per_day
 ADD year_id integer






CREATE OR REPLACE FUNCTION import_year_id_to_sales() RETURNS integer
LANGUAGE plpgsql
as $$
declare
i integer:=0;
total integer:=0;
year_ integer;
year_id_ integer:=0;


begin
select count(*) into total from (select distinct year from sales_of_cigarettes_per_adult_per_day) as qwert;
while i < total LOOP
select year into        year_ from (select  year from sales_of_cigarettes_per_adult_per_day where sales_of_cigarettes_per_adult_per_day.id = i) as qwert;
raise notice 'year_ % ',year_;
select year_id into year_id_ from (select  year_id from year where year=year_ ) as qwert;
        raise notice 'year_id_ %',year_id_;                                                                                                                                                           
UPDATE sales_of_cigarettes_per_adult_per_day SET year_id = year_id_ where year =year_;
i:=i+1;
END LOOP;
return 1;
END;
$$;


select import_year_id_to_sales()






ALTER TABLE c02_emission
 ADD year_id integer




CREATE OR REPLACE FUNCTION import_year_id_to_co2() RETURNS integer
LANGUAGE plpgsql
as $$
declare
i integer:=0;
total integer:=0;
year_ integer;
year_id_ integer:=0;


begin
select count(*) into total from (select distinct year from c02_emission) as qwert;
while i < total LOOP
select year into        year_ from (select  year from c02_emission where c02_emission.id = i) as qwert;
raise notice 'year_ % ',year_;
select year_id into year_id_ from (select  year_id from year where year=year_ ) as qwert;
        raise notice 'year_id_ %',year_id_;                                                                                                                                                           
UPDATE c02_emission SET year_id = year_id_ where year =year_;
i:=i+1;
END LOOP;
return 1;
END;
$$;


select import_year_id_to_co2()










ALTER TABLE death_rate_from_cancers_vs_average_income
 ADD year_id integer




CREATE OR REPLACE FUNCTION import_year_id_to_death_rate() RETURNS integer
LANGUAGE plpgsql
as $$
declare
i integer:=0;
total integer:=0;
year_ integer;
year_id_ integer:=0;


begin
select count(*) into total from (select distinct year from death_rate_from_cancers_vs_average_income) as qwert;
while i < total LOOP
select year into        year_ from (select  year from death_rate_from_cancers_vs_average_income where death_rate_from_cancers_vs_average_income.id = i) as qwert;
raise notice 'year_ % ',year_;
select year_id into year_id_ from (select  year_id from year where year=year_ ) as qwert;
        raise notice 'year_id_ %',year_id_;                                                                                                                                                           
UPDATE death_rate_from_cancers_vs_average_income SET year_id = year_id_ where year =year_;
i:=i+1;
END LOOP;
return 1;
END;
$$;


select import_year_id_to_death_rate()
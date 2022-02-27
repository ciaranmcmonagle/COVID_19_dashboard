 ## process_healthboard_pops.R

## Processes the healthboard population data to extract the total population (at all ages), in both men and women in each healthboard in Scotland


dir.create(file.path("processed_data","population"))
read_csv(file.path("raw_data","healthboard_pops.csv"),
         col_types = cols(.default = col_character()))%>%
  select(Year,HB, Sex,AllAges)%>%
  filter(Year==2019, Sex=="All")%>%
  write_csv(file.path("processed_data","population","person_healthboard_2019.csv"))

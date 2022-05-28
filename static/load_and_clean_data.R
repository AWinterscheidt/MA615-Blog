    library(tidyverse)
    library(naniar)
    library(haven)
    Religion20<-read.csv(here::here("static","Religion20.csv"))
    President20<-read.csv(here::here("static","President20.csv"))
    Religion16<-read.csv(here::here("static","Religion16.csv"))
    President16<-read.csv(here::here("static","President16.csv"))
    Religion12<-read.csv(here::here("static","Religion12.csv"))
    President12<-read.csv(here::here("static","President12.csv"))
    Religion08<-read.csv(here::here("static","Religion08.csv"))
    President08<-read.csv(here::here("static","President08.csv"))
    Religion04<-read.csv(here::here("static","Religion04.csv"))
    President04<-read.csv(here::here("static","President04.csv"))
    Religion00<-read.csv(here::here("static","Religion00.csv"))
    President00<-read.csv(here::here("static","President00.csv"))
    
    
    ANES_2020 <- read.csv(here::here("dataset-ignore","ANES.csv"))
    
    ANES_clean_2020<- ANES_2020 %>% 
      select("V202065x","V201014b","V201502","V201458x","V202117","V202073","V202266",
             "V202267","V202268","V202269","V202270","V202273x","V202276x","V202279x",
             "V202282x","V202286x","V202290x","V202291","V202292") %>%
      rename(party = V202065x)%>%
      rename(state = V201014b)%>%
      rename(finance.better = V201502)%>%
      rename(religion = V201458x)%>%
      rename(vote.method = V202117)%>%
      rename(vote.candidate = V202073)%>%
      rename(child.indep = V202266)%>%
      rename(child.curio = V202267)%>%
      rename(child.obed = V202268)%>%
      rename(child.consid = V202269)%>%
      rename(us.world = V202270)%>%
      rename(us.better = V202273x)%>%
      rename(rural.govt = V202276x)%>%
      rename(rural.infl = V202279x)%>%
      rename(rural.resp = V202282x)%>%
      rename(women.child = V202286x)%>%
      rename(women.work = V202290x)%>%
      rename(women.favors = V202291)%>%
      rename(women.comp = V202292)%>%
      mutate(year = as.factor(2020))%>%
      replace_with_na_if(.predicate = is.numeric,condition = ~.x<0)%>%
      full_join(Religion20,by="religion")%>%
      select(-("religion"))%>%
      full_join(President20,by="vote.candidate")%>%
      select(-("vote.candidate"))
    
    write_csv(ANES_clean_2020, file = here::here("dataset-ignore", "ANES_clean_2020.csv"))
    
    save(ANES_clean_2020, file = here::here("dataset-ignore","ANES_clean_2020.RData"))
    
    ANES_2016 <- read_dta(here::here("dataset-ignore", "anes_timeseries_2016.dta"))
    
    write_csv(ANES_2016, file = here::here("dataset-ignore", "ANES_2016.csv"))
    
    save(ANES_2016, file = here::here("dataset-ignore","ANES_2016.RData"))
    
    ANES_2016 <- read.csv(here::here("dataset-ignore","ANES_2016.csv"))
    
    ANES_2016_clean <- ANES_2016 %>%
      select("V162030x", "V161015b", "V161110", "V161265x", "V162034a", "V162239",
             "V162240", "V162241", "V162242", "V162123", "V162229x", "V162230x","V162231x",
             "V162232", "V162233")  %>%
      rename(party = V162030x)%>%
      rename(state = V161015b)%>%
      rename(finance.better = V161110)%>%
      rename(religion = V161265x)%>%
      rename(vote.candidate = V162034a)%>%
      rename(child.indep = V162239)%>%
      rename(child.curio = V162240)%>%
      rename(child.obed = V162241)%>%
      rename(child.consid = V162242)%>%
      rename(us.world = V162123)%>%
      rename(women.child = V162229x)%>%
      rename(women.work = V162230x)%>%
      rename(women.media = V162231x)%>%
      rename(women.favors = V162232)%>%
      rename(women.comp = V162233)%>%
      mutate(year = as.factor(2016))%>%
      replace_with_na_if(.predicate = is.numeric,condition = ~.x<0)%>%
      full_join(Religion16,by="religion")%>%
      select(-("religion"))%>%
      full_join(President16,by="vote.candidate")%>%
      select(-("vote.candidate"))
      
    
    write_csv(ANES_2016_clean, file = here::here("dataset-ignore", "ANES_2016_clean.csv"))
    
    save(ANES_2016_clean, file = here::here("dataset-ignore","ANES_2016_clean.RData"))
    
    ANES_2012 <- read_dta(here::here("dataset-ignore", "anes_timeseries_2012.dta"))
    
    write_csv(ANES_2012, file = here::here("dataset-ignore", "ANES_2012.csv"))
    
    save(ANES_2012, file = here::here("dataset-ignore","ANES_2012.RData"))
    
    ANES_2012 <- read.csv(here::here("dataset-ignore","ANES_2012.csv"))
    
    ANES_2012_clean <- ANES_2012 %>%
      select("prevote_reg_state", "iwrdesc_post_pid", "finance_finpast_x", "relig_7cat_x", "postvote_presvtwho", "auth_ind",
             "auth_cur", "auth_obed", "auth_consid", "women_bond_x", "women_works_x","modsex_media_x", "modsex_discamt",
             "modsex_special", "modsex_prob","modsex_disc","modsex_oppor_x")  %>%
      rename(party = iwrdesc_post_pid)%>%
      rename(state = prevote_reg_state)%>%
      rename(finance.better = finance_finpast_x)%>%
      rename(religion = relig_7cat_x)%>%
      rename(vote.candidate = postvote_presvtwho)%>%
      rename(child.indep = auth_ind)%>%
      rename(child.curio = auth_cur)%>%
      rename(child.obed = auth_obed)%>%
      rename(child.consid = auth_consid)%>%
      rename(women.child = women_bond_x)%>%
      rename(women.work = women_works_x)%>%
      rename(women.disc = modsex_discamt)%>%
      rename(women.media = modsex_media_x)%>%
      rename(women.favors = modsex_special)%>%
      rename(women.comp = modsex_prob)%>%
      rename(women.hire = modsex_disc)%>%
      rename(women.opp = modsex_oppor_x)%>%
      mutate(year = as.factor(2012))%>%
      replace_with_na_if(.predicate = is.numeric,condition = ~.x<0)%>%
      mutate(women.favors = as.integer(recode(women.favors, '5'='1','4'='2','3'='3','2'='4','1'='5')))%>%
      mutate(women.comp = as.integer(recode(women.comp, '5'='1','4'='2','3'='3','2'='4','1'='5')))%>%
      full_join(Religion12,by="religion")%>%
      select(-("religion"))%>%
      full_join(President12,by="vote.candidate")%>%
      select(-("vote.candidate"))
    
    write_csv(ANES_2012_clean, file = here::here("dataset-ignore", "ANES_2012_clean.csv"))
    
    save(ANES_2012_clean, file = here::here("dataset-ignore","ANES_2012_clean.RData"))
    
    ANES_2008 <- read_dta(here::here("dataset-ignore", "anes_timeseries_2008.dta"))
    
    write_csv(ANES_2008, file = here::here("dataset-ignore", "ANES_2008.csv"))
    
    save(ANES_2008, file = here::here("dataset-ignore","ANES_2008.RData"))
    
    ANES_2008 <- read.csv(here::here("dataset-ignore","ANES_2008.csv"))
    
    ANES_2008_clean <- ANES_2008 %>%
      select("V081201b", "V083097", "V083057x", "V083185b", "V085044a", "V085158",
             "V085159", "V085160", "V085161","V085136", "V085138","V085137")  %>%
      rename(party = V083097)%>%
      rename(state = V081201b)%>%
      rename(finance.better = V083057x)%>%
      rename(religion = V083185b)%>%
      rename(vote.candidate = V085044a)%>%
      rename(child.indep = V085158)%>%
      rename(child.curio = V085159)%>%
      rename(child.obed = V085160)%>%
      rename(child.consid = V085161)%>%
      rename(women.favors = V085136)%>%
      rename(women.comp = V085138)%>%
      rename(women.hire = V085137)%>%
      mutate(year = as.factor(2008))%>%
      replace_with_na_if(.predicate = is.numeric,condition = ~.x<0)%>%
      full_join(Religion08,by="religion")%>%
      select(-("religion"))%>%
      full_join(President08,by="vote.candidate")%>%
      select(-("vote.candidate"))
    
    write_csv(ANES_2008_clean, file = here::here("dataset-ignore", "ANES_2008_clean.csv"))
    
    save(ANES_2008_clean, file = here::here("dataset-ignore","ANES_2008_clean.RData"))
    
    
    ANES_2004 <- read_dta(here::here("dataset-ignore", "anes2004TS.dta"))
    
    write_csv(ANES_2004, file = here::here("dataset-ignore", "ANES_2004.csv"))
    
    save(ANES_2004, file = here::here("dataset-ignore","ANES_2004.RData"))
    
    ANES_2004 <- read.csv(here::here("dataset-ignore","ANES_2004.csv"))
    
    ANES_2004_clean <- ANES_2004 %>%
      select("V041202", "V043114", "V043064", "V043247", "V045026", "V045208",
             "V045209", "V045210", "V045211","V045183", "V045185","V045184")  %>%
      rename(party = V043114)%>%
      rename(state = V041202)%>%
      rename(finance.better = V043064)%>%
      rename(religion = V043247)%>%
      rename(vote.candidate = V045026)%>%
      rename(child.indep = V045208)%>%
      rename(child.curio = V045209)%>%
      rename(child.obed = V045210)%>%
      rename(child.consid = V045211)%>%
      rename(women.favors = V045183)%>%
      rename(women.comp = V045185)%>%
      rename(women.hire = V045184)%>%
      mutate(year = as.factor(2004))%>%
      mutate(vote.candidate = as.integer(recode(vote.candidate,"1"="1","3"="3","5"="5","7"="7","8"="-8","9"="-9")))%>%
      mutate(women.comp = as.integer(recode(women.comp, "1"="1","2"="2", "3"="3","4"="4","5"="5","8"="-8","9"="-9")))%>%
      mutate(women.hire = as.integer(recode(women.hire, "1"="1","2"="2", "3"="3","4"="4","5"="5","8"="-8","9"="-9")))%>%
      mutate(women.favors = as.integer(recode(women.favors, "1"="1","2"="2", "3"="3","4"="4","5"="5","8"="-8","9"="-9")))%>%
      mutate(child.consid = as.integer(recode(child.consid, "1"="1", "3"="3","5"="5","7"="7","8"="-8","9"="-9")))%>%
      mutate(child.obed = as.integer(recode(child.obed, "1"="1", "3"="3","5"="5","7"="7","8"="-8","9"="-9")))%>%
      mutate(child.curio = as.integer(recode(child.curio, "1"="1", "3"="3","5"="5","7"="7","8"="-8","9"="-9")))%>%
      mutate(child.indep = as.integer(recode(child.indep, "1"="1", "3"="3","5"="5","7"="7","8"="-8","9"="-9")))%>%
      mutate(religion = as.integer(recode(religion, "1"="1","2"="2", "3"="3","4"="4","6"="6","7"="7","0"="-1","8"="-8","9"="-9")))%>%
      mutate(finance.better = as.integer(recode(finance.better, "1"="1","2"="2", "3"="3","4"="4","5"="5","8"="-8","9"="-9")))%>%
      mutate(party = as.integer(recode(party, "1"="2","2"="1","3" = "3","4"="4","5"="5", "8"="-8","9"="-9")))%>%
      replace_with_na_if(.predicate = is.numeric,condition = ~.x<0)%>%
      full_join(Religion04,by="religion")%>%
      select(-("religion"))%>%
      full_join(President04,by="vote.candidate")%>%
      select(-("vote.candidate"))
    
    write_csv(ANES_2004_clean, file = here::here("dataset-ignore", "ANES_2004_clean.csv"))
    
    save(ANES_2004_clean, file = here::here("dataset-ignore","ANES_2004_clean.RData"))
    
    ANES_2000 <- read_dta(here::here("dataset-ignore", "anes2000TS.dta"))
    
    write_csv(ANES_2000, file = here::here("dataset-ignore", "ANES_2000.csv"))
    
    save(ANES_2000, file = here::here("dataset-ignore","ANES_2000.RData"))
    
    ANES_2000 <- read.csv(here::here("dataset-ignore","ANES_2000.csv"))
    
    ANES_2000_clean <- ANES_2000 %>%
      select("V000080", "V000519", "V001412", "V000883", "V001249", "V001586",
             "V001588", "V001587", "V001589")  %>%
      rename(party = V000519)%>%
      rename(state = V000080)%>%
      rename(finance.better = V001412)%>%
      rename(religion = V000883)%>%
      rename(vote.candidate = V001249)%>%
      rename(child.indep = V001586)%>%
      rename(child.curio = V001588)%>%
      rename(child.obed = V001587)%>%
      rename(child.consid = V001589)%>%
      mutate(year = as.factor(2000))%>%
      mutate(vote.candidate = as.integer(recode(vote.candidate,"1"="1","2"="2","3"="3","4"="4","5"="5","6"="6","7"="7","8"="-8","9"="-9","0"="-1")))%>%
      mutate(child.consid = as.integer(recode(child.consid, "1"="1", "3"="3","5"="5","7"="7","8"="-8","9"="-9","0"="-1")))%>%
      mutate(child.obed = as.integer(recode(child.obed, "1"="1", "3"="3","5"="5","7"="7","8"="-8","9"="-9","0"="-1")))%>%
      mutate(child.curio = as.integer(recode(child.curio, "1"="1", "3"="3","5"="5","7"="7","8"="-8","9"="-9","0"="-1")))%>%
      mutate(child.indep = as.integer(recode(child.indep, "1"="1", "3"="3","5"="5","7"="7","8"="-8","9"="-9","0"="-1")))%>%
      mutate(religion = as.integer(recode(religion, "1"="1","2"="2", "3"="3","7"="7","0"="-1","8"="-8","9"="-9")))%>%
      mutate(finance.better = as.integer(recode(finance.better, "1"="1","2"="2", "3"="3","4"="4","5"="5","8"="-8","9"="-9","0"="-1")))%>%
      mutate(party = as.integer(recode(party, "1"="1","2"="2","3" = "3","4"="4","5"="5", "8"="-8","9"="-9","0"="-1")))%>%
      replace_with_na_if(.predicate = is.numeric,condition = ~.x<0)%>%
      full_join(Religion00,by="religion")%>%
      select(-("religion"))%>%
      full_join(President00,by="vote.candidate")%>%
      select(-("vote.candidate"))
    
    write_csv(ANES_2000_clean, file = here::here("dataset-ignore", "ANES_2000_clean.csv"))
    
    save(ANES_2000_clean, file = here::here("dataset-ignore","ANES_2000_clean.RData"))
    
    ANES_cross<-ANES_clean_2020%>%
      plyr::rbind.fill(ANES_2016_clean)%>%
      plyr::rbind.fill(ANES_2012_clean)%>%
      plyr::rbind.fill(ANES_2008_clean)%>%
      plyr::rbind.fill(ANES_2004_clean)%>%
      plyr::rbind.fill(ANES_2000_clean)
    
    write_csv(ANES_cross, file = here::here("dataset-ignore", "ANES_cross.csv"))
    
    save(ANES_cross, file = here::here("dataset-ignore","ANES_cross.RData"))
    ## Blog post 2
    
    
    ANES_sum<-ANES_cross
    
    
    ANES_sum$rural.govt[ANES_sum$rural.govt==1]<-0
    ANES_sum$rural.govt[ANES_sum$rural.govt==2]<-.17
    ANES_sum$rural.govt[ANES_sum$rural.govt==3]<-.34
    ANES_sum$rural.govt[ANES_sum$rural.govt==4]<-.51
    ANES_sum$rural.govt[ANES_sum$rural.govt==5]<-.68
    ANES_sum$rural.govt[ANES_sum$rural.govt==6]<-.85
    ANES_sum$rural.govt[ANES_sum$rural.govt==7]<-1
    
    
    ANES_sum$rural.infl[ANES_sum$rural.infl==1]<-0
    ANES_sum$rural.infl[ANES_sum$rural.infl==2]<-.17
    ANES_sum$rural.infl[ANES_sum$rural.infl==3]<-.34
    ANES_sum$rural.infl[ANES_sum$rural.infl==4]<-.51
    ANES_sum$rural.infl[ANES_sum$rural.infl==5]<-.68
    ANES_sum$rural.infl[ANES_sum$rural.infl==6]<-.85
    ANES_sum$rural.infl[ANES_sum$rural.infl==7]<-1
    
    ANES_sum$rural.resp[ANES_sum$rural.resp==1]<-0
    ANES_sum$rural.resp[ANES_sum$rural.resp==2]<-.17
    ANES_sum$rural.resp[ANES_sum$rural.resp==3]<-.34
    ANES_sum$rural.resp[ANES_sum$rural.resp==4]<-.51
    ANES_sum$rural.resp[ANES_sum$rural.resp==5]<-.68
    ANES_sum$rural.resp[ANES_sum$rural.resp==6]<-.85
    ANES_sum$rural.resp[ANES_sum$rural.resp==7]<-1
    
    ANES_sum$women.child[ANES_sum$women.child==1]<-0
    ANES_sum$women.child[ANES_sum$women.child==2]<-.17
    ANES_sum$women.child[ANES_sum$women.child==3]<-.34
    ANES_sum$women.child[ANES_sum$women.child==4]<-.51
    ANES_sum$women.child[ANES_sum$women.child==5]<-.68
    ANES_sum$women.child[ANES_sum$women.child==6]<-.85
    ANES_sum$women.child[ANES_sum$women.child==7]<-1
    
    
    ANES_sum$women.work[ANES_sum$women.work==7]<-0
    ANES_sum$women.work[ANES_sum$women.work==6]<-.17
    ANES_sum$women.work[ANES_sum$women.work==5]<-.34
    ANES_sum$women.work[ANES_sum$women.work==4]<-.51
    ANES_sum$women.work[ANES_sum$women.work==3]<-.68
    ANES_sum$women.work[ANES_sum$women.work==2]<-.85
    ANES_sum$women.work[ANES_sum$women.work==1]<-1
    
    ANES_sum$women.media[ANES_sum$women.media==1]<-0
    ANES_sum$women.media[ANES_sum$women.media==2]<-.17
    ANES_sum$women.media[ANES_sum$women.media==3]<-.34
    ANES_sum$women.media[ANES_sum$women.media==4]<-.51
    ANES_sum$women.media[ANES_sum$women.media==5]<-.68
    ANES_sum$women.media[ANES_sum$women.media==6]<-.85
    ANES_sum$women.media[ANES_sum$women.media==7]<-1
    
    ANES_sum$women.opp[ANES_sum$women.opp==1]<-0
    ANES_sum$women.opp[ANES_sum$women.opp==2]<-.17
    ANES_sum$women.opp[ANES_sum$women.opp==3]<-.34
    ANES_sum$women.opp[ANES_sum$women.opp==4]<-.51
    ANES_sum$women.opp[ANES_sum$women.opp==5]<-.68
    ANES_sum$women.opp[ANES_sum$women.opp==6]<-.85
    ANES_sum$women.opp[ANES_sum$women.opp==7]<-1
    
    ANES_sum$us.world[ANES_sum$us.world==5]<-0
    ANES_sum$us.world[ANES_sum$us.world==4]<-.25
    ANES_sum$us.world[ANES_sum$us.world==3]<-.5
    ANES_sum$us.world[ANES_sum$us.world==2]<-.75
    ANES_sum$us.world[ANES_sum$us.world==1]<-1
    
    ANES_sum$us.better[ANES_sum$us.better==5]<-0
    ANES_sum$us.better[ANES_sum$us.better==4]<-.25
    ANES_sum$us.better[ANES_sum$us.better==3]<-.5
    ANES_sum$us.better[ANES_sum$us.better==2]<-.75
    ANES_sum$us.better[ANES_sum$us.better==1]<-1
    
    ANES_sum$women.disc[ANES_sum$women.disc==5]<-0
    ANES_sum$women.disc[ANES_sum$women.disc==4]<-.25
    ANES_sum$women.disc[ANES_sum$women.disc==3]<-.5
    ANES_sum$women.disc[ANES_sum$women.disc==2]<-.75
    ANES_sum$women.disc[ANES_sum$women.disc==1]<-1
    
    ANES_sum$women.favors[ANES_sum$women.favors==5]<-0
    ANES_sum$women.favors[ANES_sum$women.favors==4]<-.25
    ANES_sum$women.favors[ANES_sum$women.favors==3]<-.5
    ANES_sum$women.favors[ANES_sum$women.favors==2]<-.75
    ANES_sum$women.favors[ANES_sum$women.favors==1]<-1
    
    ANES_sum$women.comp[ANES_sum$women.comp==5]<-0
    ANES_sum$women.comp[ANES_sum$women.comp==4]<-.25
    ANES_sum$women.comp[ANES_sum$women.comp==3]<-.5
    ANES_sum$women.comp[ANES_sum$women.comp==2]<-.75
    ANES_sum$women.comp[ANES_sum$women.comp==1]<-1
    
    ANES_sum$women.hire[ANES_sum$women.hire==1]<-0
    ANES_sum$women.hire[ANES_sum$women.hire==2]<-.25
    ANES_sum$women.hire[ANES_sum$women.hire==3]<-.5
    ANES_sum$women.hire[ANES_sum$women.hire==4]<-.75
    ANES_sum$women.hire[ANES_sum$women.hire==5]<-1
    
    ANES_sum$child.indep[ANES_sum$child.indep==1]<-0
    ANES_sum$child.indep[ANES_sum$child.indep==2 | ANES_sum$child.indep==5]<-1
    ANES_sum$child.indep[ANES_sum$child.indep==3]<-.5
    ANES_sum$child.indep[ANES_sum$child.indep==7 | ANES_sum$child.indep == 4]<-NA
    
    ANES_sum$child.curio[ANES_sum$child.curio==1]<-0
    ANES_sum$child.curio[ANES_sum$child.curio==2 | ANES_sum$child.curio==5]<-1
    ANES_sum$child.curio[ANES_sum$child.curio==3]<-.5
    ANES_sum$child.curio[ANES_sum$child.obed==4 | ANES_sum$child.curio==7]<-NA
    
    ANES_sum$child.obed[ANES_sum$child.obed==1]<-1
    ANES_sum$child.obed[ANES_sum$child.obed==2 | ANES_sum$child.obed==5]<-0
    ANES_sum$child.obed[ANES_sum$child.obed==3]<-.5
    ANES_sum$child.obed[ANES_sum$child.obed==4 | ANES_sum$child.obed==7]<-NA
    
    ANES_sum$child.consid[ANES_sum$child.consid==1]<-0
    ANES_sum$child.consid[ANES_sum$child.consid==2 | ANES_sum$child.consid==5]<-1
    ANES_sum$child.consid[ANES_sum$child.consid==3]<-.5
    ANES_sum$child.consid[ANES_sum$child.obed==4 | ANES_sum$child.consid==7]<-NA
    
    
    library(usmap)
    ANES_sum$party[ANES_sum$party==1]<-"Democrat"
    ANES_sum$party[ANES_sum$party==2]<-"Republican"
    ANES_sum$party[ANES_sum$party==3 | ANES_sum$party==4 | ANES_sum$party == 5]<-"Independent"
    
    
    ANES_sum$state[ANES_sum$state==1]<-"alabama"
    ANES_sum$state[ANES_sum$state==2]<-"alaska"
    ANES_sum$state[ANES_sum$state==4]<-"arizona"
    ANES_sum$state[ANES_sum$state==5]<-"arkansas"
    ANES_sum$state[ANES_sum$state==6]<-"california"
    ANES_sum$state[ANES_sum$state==8]<-"colorado"
    ANES_sum$state[ANES_sum$state==9]<-"connecticut"
    ANES_sum$state[ANES_sum$state==10]<-"delaware"
    ANES_sum$state[ANES_sum$state==11]<-"washington dc"
    ANES_sum$state[ANES_sum$state==12]<-"florida"
    ANES_sum$state[ANES_sum$state==13]<-"georgia"
    ANES_sum$state[ANES_sum$state==15]<-"hawaii"
    ANES_sum$state[ANES_sum$state==16]<-"idaho"
    ANES_sum$state[ANES_sum$state==17]<-"illinois"
    ANES_sum$state[ANES_sum$state==18]<-"indiana"
    ANES_sum$state[ANES_sum$state==19]<-"iowa"
    ANES_sum$state[ANES_sum$state==20]<-"kansas"
    ANES_sum$state[ANES_sum$state==21]<-"kentucky"
    ANES_sum$state[ANES_sum$state==22]<-"louisiana"
    ANES_sum$state[ANES_sum$state==23]<-"maine"
    ANES_sum$state[ANES_sum$state==24]<-"maryland"
    ANES_sum$state[ANES_sum$state==25]<-"massachusetts"
    ANES_sum$state[ANES_sum$state==26]<-"michigan"
    ANES_sum$state[ANES_sum$state==27]<-"minnesota"
    ANES_sum$state[ANES_sum$state==28]<-"mississippi"
    ANES_sum$state[ANES_sum$state==29]<-"missouri"
    ANES_sum$state[ANES_sum$state==30]<-"montana"
    ANES_sum$state[ANES_sum$state==31]<-"nebraska"
    ANES_sum$state[ANES_sum$state==32]<-"nevada"
    ANES_sum$state[ANES_sum$state==33]<-"new hampshire"
    ANES_sum$state[ANES_sum$state==34]<-"new jersey"
    ANES_sum$state[ANES_sum$state==35]<-"new mexico"
    ANES_sum$state[ANES_sum$state==36]<-"new york"
    ANES_sum$state[ANES_sum$state==37]<-"north carolina"
    ANES_sum$state[ANES_sum$state==38]<-"north dakota"
    ANES_sum$state[ANES_sum$state==39]<-"ohio"
    ANES_sum$state[ANES_sum$state==40]<-"oklahoma"
    ANES_sum$state[ANES_sum$state==41]<-"oregon"
    ANES_sum$state[ANES_sum$state==42]<-"pennsylvania"
    ANES_sum$state[ANES_sum$state==44]<-"rhode island"
    ANES_sum$state[ANES_sum$state==45]<-"south carolina"
    ANES_sum$state[ANES_sum$state==46]<-"south dakota"
    ANES_sum$state[ANES_sum$state==47]<-"tennessee"
    ANES_sum$state[ANES_sum$state==48]<-"texas"
    ANES_sum$state[ANES_sum$state==49]<-"utah"
    ANES_sum$state[ANES_sum$state==50]<-"vermont"
    ANES_sum$state[ANES_sum$state==51]<-"virginia"
    ANES_sum$state[ANES_sum$state==53]<-"washington"
    ANES_sum$state[ANES_sum$state==54]<-"west virginia"
    ANES_sum$state[ANES_sum$state==55]<-"wisconsin"
    ANES_sum$state[ANES_sum$state==56]<-"wyoming"
    ANES_sum$state[ANES_sum$state==86|ANES_sum$state==96 | ANES_sum$state==99 | ANES_sum$state==0]<-NA
    
    ANES_sum$score<-as.character(rowMeans(ANES_sum[,c(5:17,21:24)],na.rm=TRUE))
    ANES_sum<-replace_with_na_if(ANES_sum,.predicate=is.character,condition= ~.x=="NaN")
    ANES_sum$score<-as.numeric(ANES_sum$score)
    
    write_csv(ANES_sum, file = here::here("dataset-ignore", "ANES_sum.csv"))
    
    save(ANES_sum, file = here::here("dataset-ignore","ANES_sum.RData"))
    
    ##Blog 4
    
    ANES_normalized<-subset(ANES_sum,select = c(party, state, score,year))%>%
      mutate(child_score = (rowMeans(ANES_sum[,c(5:8)],na.rm=TRUE)))%>%
      mutate(women_score = (rowMeans(ANES_sum[,c(14:17,21:24)],na.rm=TRUE)))%>%
      mutate(foreign_score = (rowMeans(ANES_sum[,c(9:10)],na.rm=TRUE)))%>%
      mutate(rural_score = (rowMeans(ANES_sum[,c(11:13)],na.rm=TRUE)))%>%
      mutate(financial = (ANES_sum$finance.better-1)/4)%>%
      mutate(absentee = ANES_sum$vote.method-1)
    
    write_csv(ANES_normalized, file = here::here("dataset-ignore", "ANES_normalized.csv"))
    
    save(ANES_normalized, file = here::here("dataset-ignore","ANES_normalized.RData"))
    
    ANES_state<- ANES_normalized%>%
      group_by(state,year)%>%
      dplyr::summarize(score=mean(score,na.rm=TRUE),cs=mean(child_score,na.rm=TRUE),ws=mean(women_score,na.rm=TRUE),fs=mean(foreign_score,na.rm=TRUE),rs = mean(rural_score,na.rm=TRUE))
    ANES_state$cs[is.nan(ANES_state$cs)]<-NA
    ANES_state$ws[is.nan(ANES_state$ws)]<-NA
    ANES_state$fs[is.nan(ANES_state$fs)]<-NA
    ANES_state$rs[is.nan(ANES_state$rs)]<-NA
    ## Blog post 5
    
    # load and clean MIT election data 
    
    MIT_ELECTION <- read.csv(here::here("dataset-ignore","1976-2020-president.csv"))
    
    MIT_ELECTION_clean <- MIT_ELECTION %>% 
      filter(share >= .01, year >= 2000) %>% 
      select("year","state","party_simplified", "share")%>%
      mutate(state = tolower(state))%>%
      mutate(party_simplified = tolower(party_simplified))%>%
      group_by(year,state) %>% 
      replace_with_na_if(.predicate = is.numeric,condition = ~.x<0)
    
    write_csv(MIT_ELECTION_clean, file = here::here("dataset-ignore", "MIT_ELECTION_clean.csv"))
    
    save(MIT_ELECTION_clean, file = here::here("dataset-ignore","MIT_ELECTION_clean.RData"))
    
    MIT_State <- MIT_ELECTION_clean%>%
      filter(party_simplified != "other")%>%
      pivot_wider(names_from = party_simplified,values_from = share)%>%
      mutate(margin = democrat-republican)%>%
      mutate(year = as.factor(year))%>%
      left_join(ANES_state,by = c("state","year"))
      
    write_csv(MIT_State, file = here::here("dataset-ignore", "MIT_State.csv"))
    
    save(MIT_State, file = here::here("dataset-ignore","MIT_State.RData"))
    

    
    
    
                            
    
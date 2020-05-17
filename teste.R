#----------------------------------------------------------------------
#----------------------------------- CARREGAR PACOTE
#----------------------------------------------------------------------



# Definir os pacotes



pacotes_necessarios <- c('dplyr','data.table','bit64','namespace','stringr')



# Carregar



for(i in 1:length(pacotes_necessarios)){
  if(pacotes_necessarios[i] %in% installed.packages()){
    eval(parse(text=paste0("library(",pacotes_necessarios[i],")")))
    cat('Pacote carregado: ',pacotes_necessarios[i],'\n')
  } else {
    eval(parse(text=paste0("install.packages('",pacotes_necessarios[i],"')")))
    cat('Pacote instalado: ',pacotes_necessarios[i],'\n')
    eval(parse(text=paste0("library(",pacotes_necessarios[i],")")))
    cat('Pacote carregado: ',pacotes_necessarios[i],'\n')
  }
}




#----------------------------------------------------------------------
#----------------------------------- DEFINIR DIRETORIOS
#----------------------------------------------------------------------

dir <- "C:\\Users\\patri\\Documents\\2_Trabalho\\1_Consultoria\\1_Marisa Utzig Cossul\\1_Dados\\2_Transformados"
setwd(dir)
getwd()

#----------------------------------------------------------------------
#----------------------------------- IMPORTAR O DADO EXTRAÍDO
#----------------------------------------------------------------------

list.files()
dados <- fread("dados_extracao.txt",encoding = "UTF-8")
dados[]
#----------------------------------------------------------------------
#----------------------------------- MUDAR O NOME DOS CAMPOS
#----------------------------------------------------------------------

dados %>% names()
dados <- dados %>% rename(recorrencia=Recorrencia) %>%
  rename(registro_sesdf=`Registro SESDF`) %>%
  rename(class_ea=`CLASSIFICAÇÃO DO EA`) %>%
  rename(turno_ocorrencia=`Turno de ocorrência do incidente`) %>%
  rename(n_ea=`N. EA`)%>%
  rename(sesdf=SESDF) %>%
  rename(peso_nascimento_g=`PN(G)`) %>%
  rename(idade_gestacional_semana_dias=`IG(SEM+DIAS)`)  

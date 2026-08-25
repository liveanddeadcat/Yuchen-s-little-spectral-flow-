# investigate the unstained sample of Vagina LP

 
# load data, by lymphocyte and other cells size gates
unstained_lympho <- read.FCS("./VUM_Unstained_Lymphocytes.fcs")
unstained_others <- read.FCS("./VUM_Unstained_Other.fcs")
aurora_channels <- c('UV1-A',  'UV2-A',  'UV3-A',  'UV4-A',  'UV5-A',  'UV6-A',  'UV7-A',  'UV8-A',  'UV9-A',  'UV10-A','UV11-A', 'UV12-A', 'UV13-A', 'UV14-A', 'UV15-A', 'UV16-A', 'V1-A',   'V2-A',  
                     'V3-A',   'V4-A',   'V5-A',   'V6-A',   'V7-A',   'V8-A',   'V9-A',   'V10-A',  'V11-A',  'V12-A',  'V13-A',  'V14-A',  'V15-A',  'V16-A',  'B1-A',   'B2-A',   'B3-A',   'B4-A',  'B5-A',   'B6-A',   'B7-A',   'B8-A',   'B9-A',   'B10-A',  'B11-A',  'B12-A',  'B13-A',  'B14-A',  'YG1-A',  'YG2-A',  'YG3-A',  'YG4-A',  'YG5-A',  'YG6-A',  'YG7-A',  'YG8-A', 'YG9-A',  'YG10-A', 'R1-A',   'R2-A',   'R3-A',   'R4-A',   'R5-A',   'R6-A',   'R7-A',   'R8-A'  )
set.seed(223)
df_other <- spectralplot(unstained_others, params = aurora_channels, normalize = TRUE)$data
df_lympho <- spectralplot(unstained_lympho, params = aurora_channels, normalize = TRUE)$data

# Add an sample column to the dfs
df_other$cell <- "others"
df_lympho$cell <- "lympho"

# Combine dfs
df<- rbind(df_lympho,df_other)

# Plot spectral profiles
df %>% 
  ggplot(aes(x = factor(`rownames(df)`, levels = aurora_channels), y = medians.max.medians., group = cell))+
  geom_line(aes(colour = cell), linewidth = 0.7)+
  theme_bw()+
  theme(axis.text.x = element_text(angle = 45, hjust = -0.05, vjust = -0.1))+
  scale_color_manual(values = c("red","blue"))


similarity <- cor(df_lympho$medians.max.medians., df_other$medians.max.medians.)
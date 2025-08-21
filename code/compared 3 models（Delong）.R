library(pROC)
library(ggplot2)
file_paths <- c(
  '/Users/dabaibai/Downloads/同步空间/科研相关/抑郁语音/成果/nature medicine/compared 3 models/whisper_large_v2_32_rwe_test_v5_160_all.csv',
  '/Users/dabaibai/Downloads/同步空间/科研相关/抑郁语音/成果/nature medicine/compared 3 models/hubert_chinese_19_rwe_v5_160_new.csv',
  '/Users/dabaibai/Downloads/同步空间/科研相关/抑郁语音/成果/nature medicine/compared 3 models/wavlm_12_rwe_v5_160_new.csv',
  '/Users/dabaibai/Downloads/同步空间/科研相关/抑郁语音/成果/nature medicine/compared 3 models/whisper_large_v2_32_v41_test_all.csv',
  '/Users/dabaibai/Downloads/同步空间/科研相关/抑郁语音/成果/nature medicine/compared 3 models/hubert_chinese_19_v41_test_usd.csv',
  '/Users/dabaibai/Downloads/同步空间/科研相关/抑郁语音/成果/nature medicine/compared 3 models/wavlm_12_v41_test_usd.csv')

roc_obj1 <- roc(response = read.csv(file_paths[1], header=TRUE)$`target_label`, predictor = read.csv(file_paths[1], header=TRUE)$`depressed_score`)
roc_obj2 <- roc(response = read.csv(file_paths[2], header=TRUE)$`target_label`, predictor = read.csv(file_paths[2], header=TRUE)$`depressed_score`)
roc_obj3 <- roc(response = read.csv(file_paths[3], header=TRUE)$`target_label`, predictor = read.csv(file_paths[3], header=TRUE)$`depressed_score`)
roc_obj4 <- roc(response = read.csv(file_paths[4], header=TRUE)$`target_label`, predictor = read.csv(file_paths[4], header=TRUE)$`depressed_score`)
roc_obj5 <- roc(response = read.csv(file_paths[5], header=TRUE)$`target_label`, predictor = read.csv(file_paths[5], header=TRUE)$`depressed_score`)
roc_obj6 <- roc(response = read.csv(file_paths[6], header=TRUE)$`target_label`, predictor = read.csv(file_paths[6], header=TRUE)$`depressed_score`)

delong_test_1_2 <- roc.test(roc_obj1, roc_obj2, method="delong")
delong_test_1_3 <- roc.test(roc_obj1, roc_obj3, method="delong")
delong_test_2_3 <- roc.test(roc_obj2, roc_obj3, method="delong")
delong_test_4_5 <- roc.test(roc_obj4, roc_obj5, method="delong")
delong_test_4_6 <- roc.test(roc_obj4, roc_obj6, method="delong")
delong_test_5_6 <- roc.test(roc_obj5, roc_obj6, method="delong")
delong_test_1_4 <- roc.test(roc_obj1, roc_obj4, method="delong")
delong_test_2_5 <- roc.test(roc_obj2, roc_obj5, method="delong")
delong_test_3_6 <- roc.test(roc_obj3, roc_obj6, method="delong")

print(delong_test_1_2)
print(delong_test_1_3)
print(delong_test_2_3)
p_values1 <- c(0.02726, 0.0004577, 0.09212)
p_adjusted1 <- p.adjust(p_values1, method = "holm")
print(p_adjusted1)

print(delong_test_4_5)
print(delong_test_4_6)
print(delong_test_5_6)
p_values2 <- c(0.1283, 0.02656, 0.445)
p_adjusted2 <- p.adjust(p_values2, method = "holm")
print(p_adjusted2)

print(delong_test_1_4)
print(delong_test_2_5)
print(delong_test_3_6)







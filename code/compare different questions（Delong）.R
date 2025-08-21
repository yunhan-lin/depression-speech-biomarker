library(pROC)
library(ggplot2)
file_paths <-  c(
'/Users/dabaibai/Downloads/同步空间/科研相关/抑郁语音/成果/nature medicine/in_and_ex/whisper_large_v2_32_v41_test_all.csv',
'/Users/dabaibai/Downloads/同步空间/科研相关/抑郁语音/成果/nature medicine/in_and_ex/whisper_large_v2_32_rwe_test_v5_160_all.csv',
'/Users/dabaibai/Downloads/同步空间/科研相关/抑郁语音/成果/nature medicine/in_and_ex/whisper_large_v2_32_v41_test_close.csv',
'/Users/dabaibai/Downloads/同步空间/科研相关/抑郁语音/成果/nature medicine/in_and_ex/whisper_large_v2_32_rwe_test_v5_160_close.csv',
'/Users/dabaibai/Downloads/同步空间/科研相关/抑郁语音/成果/nature medicine/in_and_ex/whisper_large_v2_32_v41_test_open.csv',
'/Users/dabaibai/Downloads/同步空间/科研相关/抑郁语音/成果/nature medicine/in_and_ex/whisper_large_v2_32_rwe_test_v5_160_open.csv',
'/Users/dabaibai/Downloads/同步空间/科研相关/抑郁语音/成果/nature medicine/in_and_ex/whisper_large_v2_32_v41_test_negative.csv',
'/Users/dabaibai/Downloads/同步空间/科研相关/抑郁语音/成果/nature medicine/in_and_ex/whisper_large_v2_32_rwe_test_v5_160_negative.csv',
'/Users/dabaibai/Downloads/同步空间/科研相关/抑郁语音/成果/nature medicine/in_and_ex/whisper_large_v2_32_v41_test_neutral.csv',
'/Users/dabaibai/Downloads/同步空间/科研相关/抑郁语音/成果/nature medicine/in_and_ex/whisper_large_v2_32_rwe_test_v5_160_neutral.csv'
'/Users/dabaibai/Downloads/同步空间/科研相关/抑郁语音/成果/nature medicine/in_and_ex/whisper_large_v2_32_v41_test_positive.csv',
'/Users/dabaibai/Downloads/同步空间/科研相关/抑郁语音/成果/nature medicine/in_and_ex/whisper_large_v2_32_rwe_test_v5_160_positive.csv')
all_in <- roc(response = read.csv(file_paths[1], header=TRUE)$`target_label`, predictor = read.csv(file_paths[1], header=TRUE)$`depressed_score`)
all_ex <- roc(response = read.csv(file_paths[2], header=TRUE)$`target_label`, predictor = read.csv(file_paths[2], header=TRUE)$`depressed_score`)
close_in <- roc(response = read.csv(file_paths[3], header=TRUE)$`target_label`, predictor = read.csv(file_paths[3], header=TRUE)$`depressed_score`)
close_ex <- roc(response = read.csv(file_paths[4], header=TRUE)$`target_label`, predictor = read.csv(file_paths[4], header=TRUE)$`depressed_score`)
open_in <- roc(response = read.csv(file_paths[5], header=TRUE)$`target_label`, predictor = read.csv(file_paths[5], header=TRUE)$`depressed_score`)
open_ex <- roc(response = read.csv(file_paths[6], header=TRUE)$`target_label`, predictor = read.csv(file_paths[6], header=TRUE)$`depressed_score`)
negative_in <- roc(response = read.csv(file_paths[7], header=TRUE)$`target_label`, predictor = read.csv(file_paths[7], header=TRUE)$`depressed_score`)
negative_ex <- roc(response = read.csv(file_paths[8], header=TRUE)$`target_label`, predictor = read.csv(file_paths[8], header=TRUE)$`depressed_score`)
neutral_in <- roc(response = read.csv(file_paths[9], header=TRUE)$`target_label`, predictor = read.csv(file_paths[9], header=TRUE)$`depressed_score`)
neutral_ex <- roc(response = read.csv(file_paths[10], header=TRUE)$`target_label`, predictor = read.csv(file_paths[10], header=TRUE)$`depressed_score`)
positive_in <- roc(response = read.csv(file_paths[11], header=TRUE)$`target_label`, predictor = read.csv(file_paths[11], header=TRUE)$`depressed_score`)
positive_ex <- roc(response = read.csv(file_paths[12], header=TRUE)$`target_label`, predictor = read.csv(file_paths[12], header=TRUE)$`depressed_score`)
# ex vs in
delong_test_all <- roc.test(all_in, all_ex, method="delong")
delong_test_close <- roc.test(close_in, close_ex, method="delong")
delong_test_open <- roc.test(open_in, open_ex, method="delong")
delong_test_negative <- roc.test(negative_in, negative_ex, method="delong")
delong_test_neutral <- roc.test(neutral_in, neutral_ex, method="delong")
delong_test_positive <- roc.test(positive_in, positive_ex, method="delong")
print(delong_test_all)
print(delong_test_close)
print(delong_test_open)
print(delong_test_negative)
print(delong_test_neutral)
print(delong_test_positive)
# emotion
delong_test_negative_neutral<- roc.test(negative_in, neutral_in, method="delong")
delong_test_negative_positive<- roc.test(negative_in, positive_in, method="delong")
delong_test_positive_neutral<- roc.test(positive_in, neutral_in, method="delong")
print(delong_test_negative_neutral)
print(delong_test_negative_positive)
print(delong_test_positive_neutral)
p_values <- c(0.5719, 0.1832, 0.0522)
p_adjusted <- p.adjust(p_values, method = "bonferroni")
print(p_adjusted)

delong_test_negative_neutral<- roc.test(negative_ex, neutral_ex, method="delong")
delong_test_negative_positive<- roc.test(negative_ex, positive_ex, method="delong")
delong_test_positive_neutral<- roc.test(positive_ex, neutral_ex, method="delong")
print(delong_test_negative_neutral)
print(delong_test_negative_positive)
print(delong_test_positive_neutral)
p_values <- c(0.4952, 1, 0.4887)
p_adjusted <- p.adjust(p_values, method = "bonferroni")
print(p_adjusted)
# interview
delong_test_close_open <- roc.test(close_in, open_in, method="delong")
print(delong_test_close_open)
delong_test_close_open <- roc.test(close_ex, open_ex, method="delong")
print(delong_test_close_open)

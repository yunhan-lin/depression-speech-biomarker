library(pROC)
library(ggplot2)

external_df <- read.csv('/data/external_dataset.csv', header=TRUE)
internal_df <- read.csv('/data/internal_dataset.csv', header=TRUE)

# External
whisper_ex <- roc(response = external_df$target_label, predictor = external_df$whisper_all_score)
hubert_ex <- roc(response = external_df$target_label, predictor = external_df$hubert_score)
wavlm_ex <- roc(response = external_df$target_label, predictor = external_df$wavlm_score)
all_ex <- roc(response = external_df$target_label, predictor = external_df$whisper_all_score)
close_ex <- roc(response = external_df$target_label, predictor = external_df$whisper_close_score)
open_ex <- roc(response = external_df$target_label, predictor = external_df$whisper_open_score)
negative_ex <- roc(response = external_df$target_label, predictor = external_df$whisper_negative_score)
neutral_ex <- roc(response = external_df$target_label, predictor = external_df$whisper_neutral_score)
positive_ex <- roc(response = external_df$target_label, predictor = external_df$whisper_positive_score)

# Internal
whisper_in <- roc(response = internal_df$target_label, predictor = internal_df$whisper_all_score)
hubert_in <- roc(response = internal_df$target_label, predictor = internal_df$hubert_score)
wavlm_in <- roc(response = internal_df$target_label, predictor = internal_df$wavlm_score)
all_in <- roc(response = internal_df$target_label, predictor = internal_df$whisper_all_score)
close_in <- roc(response = internal_df$target_label, predictor = internal_df$whisper_close_score)
open_in <- roc(response = internal_df$target_label, predictor = internal_df$whisper_open_score)
negative_in <- roc(response = internal_df$target_label, predictor = internal_df$whisper_negative_score)
neutral_in <- roc(response = internal_df$target_label, predictor = internal_df$whisper_neutral_score)
positive_in <- roc(response = internal_df$target_label, predictor = internal_df$whisper_positive_score)

# ============================================
#  Cross-Dataset Comparison of 3 Model (Extended Data Table 2)
# ============================================
cat("\n========== Cross-Dataset Comparison ==========\n")
delong_whisper_cross <- roc.test(whisper_ex, whisper_in, method="delong")
delong_hubert_cross <- roc.test(hubert_ex, hubert_in, method="delong")
delong_wavlm_cross <- roc.test(wavlm_ex, wavlm_in, method="delong")
cat("\nWhisper (External vs Internal):\n"); print(delong_whisper_cross)
cat("\nHubert (External vs Internal):\n"); print(delong_hubert_cross)
cat("\nWavLM (External vs Internal):\n"); print(delong_wavlm_cross)

# ============================================
#  Model Comparison (Extended Data Table 3)
# ============================================
cat("\n========== Model Comparison (External) ==========\n")
delong_whisper_hubert_ex <- roc.test(whisper_ex, hubert_ex, method="delong")
delong_whisper_wavlm_ex <- roc.test(whisper_ex, wavlm_ex, method="delong")
delong_hubert_wavlm_ex <- roc.test(hubert_ex, wavlm_ex, method="delong")
cat("\nWhisper vs Hubert:\n"); print(delong_whisper_hubert_ex)
cat("\nWhisper vs WavLM:\n"); print(delong_whisper_wavlm_ex)
cat("\nHubert vs WavLM:\n"); print(delong_hubert_wavlm_ex)
p_values_ex <- c(
  delong_whisper_hubert_ex$p.value,
  delong_whisper_wavlm_ex$p.value,
  delong_hubert_wavlm_ex$p.value
)
p_adjusted_ex <- p.adjust(p_values_ex, method = "BH")
cat("\n adjusted p-values (External):\n")
print(p_adjusted_ex)

cat("\n========== Model Comparison (Internal) ==========\n")
delong_whisper_hubert_in <- roc.test(whisper_in, hubert_in, method="delong")
delong_whisper_wavlm_in <- roc.test(whisper_in, wavlm_in, method="delong")
delong_hubert_wavlm_in <- roc.test(hubert_in, wavlm_in, method="delong")
cat("\nWhisper vs Hubert:\n"); print(delong_whisper_hubert_in)
cat("\nWhisper vs WavLM:\n"); print(delong_whisper_wavlm_in)
cat("\nHubert vs WavLM:\n"); print(delong_hubert_wavlm_in)
p_values_in <- c(
  delong_whisper_hubert_in$p.value,
  delong_whisper_wavlm_in$p.value,
  delong_hubert_wavlm_in$p.value
)
p_adjusted_in <- p.adjust(p_values_in, method = "BH")
cat("\n adjusted p-values (Internal):\n")
print(p_adjusted_in)

# ============================================
# External vs Internal Performance of dimensions questions (Extended Data Table 4)
# ============================================
cat("\n========== External vs Internal Validation ==========\n")
delong_test_all <- roc.test(all_in, all_ex, method="delong")
delong_test_close <- roc.test(close_in, close_ex, method="delong")
delong_test_open <- roc.test(open_in, open_ex, method="delong")
delong_test_negative <- roc.test(negative_in, negative_ex, method="delong")
delong_test_neutral <- roc.test(neutral_in, neutral_ex, method="delong")
delong_test_positive <- roc.test(positive_in, positive_ex, method="delong")
cat("\nAll:\n"); print(delong_test_all)
cat("\nClose:\n"); print(delong_test_close)
cat("\nOpen:\n"); print(delong_test_open)
cat("\nNegative:\n"); print(delong_test_negative)
cat("\nNeutral:\n"); print(delong_test_neutral)
cat("\nPositive:\n"); print(delong_test_positive)

# ============================================
# AUC Compare of Different Dimensions (Extended Data Table 5)
# ============================================
cat("\n========== Emotion Comparison (Internal) ==========\n")
delong_test_negative_neutral_in <- roc.test(negative_in, neutral_in, method="delong")
delong_test_negative_positive_in <- roc.test(negative_in, positive_in, method="delong")
delong_test_positive_neutral_in <- roc.test(positive_in, neutral_in, method="delong")
cat("\nNegative vs Neutral:\n"); print(delong_test_negative_neutral_in)
cat("\nNegative vs Positive:\n"); print(delong_test_negative_positive_in)
cat("\nPositive vs Neutral:\n"); print(delong_test_positive_neutral_in)
p_values_emotion_in <- c(
  delong_test_negative_neutral_in$p.value,
  delong_test_negative_positive_in$p.value,
  delong_test_positive_neutral_in$p.value
)
p_adjusted_emotion_in <- p.adjust(p_values_emotion_in, method = "BH")
cat("\n adjusted p-values (Internal):\n")
print(p_adjusted_emotion_in)

cat("\n========== Emotion Comparison (External) ==========\n")
delong_test_negative_neutral_ex <- roc.test(negative_ex, neutral_ex, method="delong")
delong_test_negative_positive_ex <- roc.test(negative_ex, positive_ex, method="delong")
delong_test_positive_neutral_ex <- roc.test(positive_ex, neutral_ex, method="delong")
cat("\nNegative vs Neutral:\n"); print(delong_test_negative_neutral_ex)
cat("\nNegative vs Positive:\n"); print(delong_test_negative_positive_ex)
cat("\nPositive vs Neutral:\n"); print(delong_test_positive_neutral_ex)
p_values_emotion_ex <- c(
  delong_test_negative_neutral_ex$p.value,
  delong_test_negative_positive_ex$p.value,
  delong_test_positive_neutral_ex$p.value
)
p_adjusted_emotion_ex <- p.adjust(p_values_emotion_ex, method = "BH")
cat("\n adjusted p-values (External):\n")
print(p_adjusted_emotion_ex)

cat("\n========== Interview Type Comparison ==========\n")
delong_test_close_open_in <- roc.test(close_in, open_in, method="delong")
delong_test_close_open_ex <- roc.test(close_ex, open_ex, method="delong")
cat("\nClose vs Open (Internal):\n"); print(delong_test_close_open_in)
cat("\nClose vs Open (External):\n"); print(delong_test_close_open_ex)


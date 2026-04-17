# =============================================================
# 00_setup.R
# Script de configuração inicial — Ecologia de Paisagens BO-304
# Execute UMA VEZ no início da disciplina
# =============================================================

# ---- 1. Lista de pacotes necessários ----
pacotes <- c(
  "terra", "sf",
  "landscapemetrics",
  "tmap", "ggplot2", "tidyterra",
  "vegan", "iNEXT",
  "dplyr", "tidyr", "readr", "tibble", "purrr",
  "geodata", "rgbif",
  "rnaturalearth", "rnaturalearthdata",
  "remotes", "here"
)

# ---- 2. Instalar os que faltam ----
novos <- pacotes[!(pacotes %in% installed.packages()[, "Package"])]
if (length(novos) > 0) {
  message("Instalando ", length(novos), " pacote(s) novo(s)...")
  install.packages(novos)
} else {
  message("Todos os pacotes já estão instalados.")
}

# ---- 3. Verificação final ----
message("\n=== VERIFICAÇÃO DOS PACOTES ===")
for (pkg in pacotes) {
  ok <- requireNamespace(pkg, quietly = TRUE)
  cat(ifelse(ok, "✓", "✗"), sprintf(" %-25s", pkg),
      ifelse(ok, paste("v", packageVersion(pkg)), "FALHOU"), "\n")
}

message("\nConfiguracao concluida! Versao do R: ", R.version.string)

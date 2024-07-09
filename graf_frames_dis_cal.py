import pandas as pd
import matplotlib.pyplot as plt

# Carregar o arquivo de log
log_file_path = 'logs/b.log'

# Ler o arquivo de log
log_data = pd.read_csv(log_file_path)

# Inspecionar as primeiras linhas do arquivo
print(log_data.head())

# Verificar as colunas disponíveis
print(log_data.columns)

# Criar o gráfico de linha para a coluna 'framesDisplayedCalc'
plt.figure(figsize=(10, 6))
plt.plot(log_data['framesDisplayedCalc'], marker='o', linestyle='-', color='b')
plt.title('Gráfico de Linha de framesDisplayedCalc')
plt.xlabel('Índice')
plt.ylabel('framesDisplayedCalc')
plt.grid(True)
plt.show()
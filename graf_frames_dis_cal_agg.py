import pandas as pd
import matplotlib.pyplot as plt

# Caminhos para os arquivos de log
log_file_paths = [
    'logs/b.log',
    'logs/c.log',
    'logs/d.log',
    'logs/r.log'
]

# Lista de cores para as linhas
colors = ['b', 'g', 'r', 'c']

# Criar o gráfico de linha
plt.figure(figsize=(10, 6))

# Iterar sobre os arquivos de log e as cores
for path, color in zip(log_file_paths, colors):
    # Carregar o arquivo de log
    log_data = pd.read_csv(path)
    
    # Plotar os dados de 'framesDisplayedCalc'
    plt.plot(log_data['framesDisplayedCalc'], marker='o', linestyle='-', color=color, label=path)


# Adicionar título e rótulos
plt.title('Gráfico de Linha de framesDisplayedCalc')
plt.xlabel('Índice')
plt.ylabel('framesDisplayedCalc')
plt.grid(True)
plt.legend()  # Adicionar legenda para diferenciar as linhas
plt.show()
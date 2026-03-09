#!/bin/bash

# SHELLSCRIPT DE COMANDOS BÁSICOS - UBUNTU LINUX
# Autor: Bernardo
# Descrição: Script demonstrando comandos básicos do Ubuntu
# Distribuição: Testado no Ubuntu 20.04/22.04/24.04

# Configurações iniciais
set -e  # Para o script se houver erro (opcional, comentar se quiser continuar mesmo com erros)

# Limpa a tela para melhor visualização
clear

# Função para criar separadores visuais
separador() {
    echo "=================================================="
}

# Cabeçalho
separador
echo "    INICIANDO SCRIPT DE COMANDOS BÁSICOS UBUNTU    "
separador
echo ""

# 1. COMANDOS DE INFORMAÇÃO DO SISTEMA
echo "📌 SEÇÃO 1: INFORMAÇÕES DO SISTEMA"
separador

# Mostra o diretório atual
echo "1. Diretório atual (pwd):"
pwd
echo ""

# Lista arquivos do diretório atual com detalhes
echo "2. Listando arquivos do diretório atual (ls -la):"
ls -la
echo ""

# Mostra informações do sistema
echo "3. Informações do sistema (uname -a):"
uname -a
echo ""

# Mostra informações da distribuição Ubuntu
echo "4. Versão do Ubuntu:"
lsb_release -a 2>/dev/null || cat /etc/os-release | grep -E "^(NAME|VERSION)="
echo ""

# Mostra informações do kernel
echo "5. Versão do Kernel:"
cat /proc/version
echo ""

# Mostra o hostname
echo "6. Nome do host (hostnamectl):"
hostnamectl | head -3
echo ""

# Mostra usuário atual
echo "7. Usuário atual (whoami):"
whoami
echo ""

# Mostra usuários logados
echo "8. Usuários logados no sistema (who):"
who || echo "Nenhum outro usuário logado"
echo ""

# Mostra data e hora
echo "9. Data e hora atual (date):"
date "+%A, %d de %B de %Y - %H:%M:%S"
echo ""

# Mostra calendário
echo "10. Calendário do mês atual (cal):"
cal
echo ""

# Mostra tempo de atividade do sistema
echo "11. Tempo de atividade do sistema (uptime):"
uptime
echo ""

# 2. COMANDOS DE GERENCIAMENTO DE ARQUIVOS
echo "📌 SEÇÃO 2: GERENCIAMENTO DE ARQUIVOS"
separador

# Cria diretórios de teste
echo "12. Criando estrutura de diretórios de teste:"
mkdir -p ~/ubuntu_test/{documentos,imagens,backup}
echo "✓ Diretórios criados em: ~/ubuntu_test/"
ls -la ~/ubuntu_test/
echo ""

# Navega para o diretório de teste
echo "13. Navegando para o diretório de teste:"
cd ~/ubuntu_test/documentos
echo "Agora em: $(pwd)"
echo ""

# Cria arquivos de exemplo
echo "14. Criando arquivos de exemplo (touch):"
touch nota{1..5}.txt relatorio{1..3}.log
echo "Arquivos criados:"
ls -la
echo ""

# Adiciona conteúdo aos arquivos
echo "15. Adicionando conteúdo aos arquivos:"
echo "Este é um arquivo de texto importante" > nota1.txt
echo "Backup realizado em $(date)" > backup.log
echo "Relatório de sistema:" > relatorio1.log
df -h | head -5 >> relatorio1.log
echo "Conteúdo adicionado aos arquivos"
echo ""

# Visualiza conteúdo de arquivo
echo "16. Visualizando conteúdo de arquivo (cat):"
echo "Conteúdo do nota1.txt:"
cat nota1.txt
echo ""

# Copia arquivos
echo "17. Copiando arquivos (cp):"
cp nota1.txt ../backup/
cp nota1.txt nota1_backup.txt
echo "Arquivo copiado:"
ls -la nota1_backup.txt ../backup/
echo ""

# Move/Renomeia arquivo
echo "18. Renomeando/Movendo arquivo (mv):"
mv nota2.txt nota_renomeada.txt
echo "Arquivo renomeado:"
ls -la nota_renomeada.txt
echo ""

# Conta linhas, palavras e caracteres
echo "19. Estatísticas do arquivo (wc):"
wc relatorio1.log
echo ""

# Mostra primeiras linhas
echo "20. Primeiras 2 linhas do relatório (head):"
head -2 relatorio1.log
echo ""

# Mostra últimas linhas
echo "21. Últimas 2 linhas do relatório (tail):"
tail -2 relatorio1.log
echo ""

# Procura por texto em arquivos
echo "22. Procurando texto em arquivos (grep):"
grep -r "sistema" .
echo ""

# 3. COMANDOS DE PERMISSÕES E PROPRIETÁRIO
echo "📌 SEÇÃO 3: PERMISSÕES E PROPRIETÁRIO"
separador

# Mostra permissões detalhadas
echo "23. Permissões atuais dos arquivos:"
ls -l
echo ""

# Altera permissões
echo "24. Alterando permissões (chmod):"
chmod 644 nota1.txt
chmod +x relatorio1.log
echo "Novas permissões:"
ls -l nota1.txt relatorio1.log
echo ""

# Altera proprietário (comentado pois precisa de sudo)
echo "25. Alterar proprietário (chown) - requer sudo, exemplo comentado"
echo "# sudo chown root:root nota1.txt"
echo ""

# 4. COMANDOS DE PROCESSOS E RECURSOS
echo "📌 SEÇÃO 4: PROCESSOS E RECURSOS"
separador

# Mostra processos do usuário
echo "26. Processos do usuário atual (ps):"
ps aux --forest | head -10
echo ""

# Mostra processos de forma hierárquica (se pstree estiver instalado)
echo "27. Árvore de processos (pstree):"
if command -v pstree &> /dev/null; then
    pstree | head -5
else
    echo "pstree não instalado. Instale com: sudo apt install psmisc"
fi
echo ""

# Mostra uso de memória
echo "28. Uso de memória RAM (free -h):"
free -h
echo ""

# Mostra uso de disco
echo "29. Uso de disco (df -h):"
df -h | grep -E "^(/dev/|Filesystem)"
echo ""

# Mostra espaço usado por diretórios
echo "30. Espaço usado no diretório atual (du -sh):"
du -sh * 2>/dev/null
echo ""

# 5. COMANDOS DE REDE (Ubuntu específico)
echo "📌 SEÇÃO 5: COMANDOS DE REDE"
separador

# Mostra interfaces de rede (método moderno)
echo "31. Configuração de rede (ip addr):"
ip -br addr show  # Formato resumido
echo ""

# Mostra interfaces detalhadas
echo "32. Interfaces detalhadas:"
if command -v nmcli &> /dev/null; then
    nmcli device status 2>/dev/null || echo "NetworkManager não está rodando"
else
    ip link show
fi
echo ""

# Mostra tabela de roteamento
echo "33. Tabela de roteamento (ip route):"
ip route
echo ""

# Testa conectividade (ping - 3 pacotes)
echo "34. Testando conectividade (ping -c 3 8.8.8.8):"
ping -c 3 8.8.8.8 2>/dev/null || echo "Sem conectividade com a internet"
echo ""

# Mostra portas abertas
echo "35. Portas abertas no sistema:"
ss -tuln | head -5
echo ""

# 6. GERENCIAMENTO DE PACOTES (APT - Ubuntu)
echo "📌 SEÇÃO 6: GERENCIAMENTO DE PACOTES APT"
separador

# Atualiza lista de pacotes (requer sudo, apenas simulando)
echo "36. Atualizando lista de pacotes (apt update):"
echo "Nota: Para executar: sudo apt update"
echo "Simulando apenas para demonstração"
echo ""

# Lista pacotes instalados
echo "37. Últimos 5 pacotes instalados:"
dpkg -l | tail -5
echo ""

# Busca por pacote
echo "38. Buscando pacotes relacionados a 'ubuntu':"
apt-cache search ubuntu | head -5
echo ""

# Verifica pacotes que podem ser atualizados (sem sudo)
echo "39. Pacotes com atualização disponível:"
apt list --upgradable 2>/dev/null | head -5 || echo "Execute com sudo para ver atualizações"
echo ""

# 7. COMANDOS DE USUÁRIOS E GRUPOS
echo "📌 SEÇÃO 7: USUÁRIOS E GRUPOS"
separador

# Mostra informações do usuário atual
echo "40. Informações do usuário atual (id):"
id
echo ""

# Mostra usuários do sistema
echo "41. Últimos 5 usuários do sistema:"
tail -5 /etc/passwd | cut -d: -f1,3,7
echo ""

# Mostra grupos
echo "42. Grupos do sistema:"
groups
echo ""

# Mostra logins recentes
echo "43. Últimos logins no sistema (last):"
last -n 5
echo ""

# 8. COMANDOS DE LOGS E DIAGNÓSTICO
echo "📌 SEÇÃO 8: LOGS E DIAGNÓSTICO"
separador

# Mostra logs do sistema (últimas linhas)
echo "44. Últimas linhas do syslog:"
if [ -r /var/log/syslog ]; then
    tail -3 /var/log/syslog 2>/dev/null || echo "Sem acesso ao syslog"
else
    echo "Arquivo syslog não acessível"
fi
echo ""

# Mostra mensagens do kernel
echo "45. Mensagens do kernel (dmesg):"
dmesg | tail -3
echo ""

# 9. LIMPEZA E FINALIZAÇÃO
echo "📌 SEÇÃO 9: LIMPEZA"
separador

# Volta ao diretório original
echo "46. Retornando ao diretório original:"
cd -
echo ""

# Remove diretórios de teste
echo "47. Removendo diretórios de teste:"
rm -rf ~/ubuntu_test
echo "✓ Diretório ~/ubuntu_test removido"
echo ""

# 10. COMANDOS EXTRAS E UTILITÁRIOS
echo "📌 SEÇÃO 10: UTILITÁRIOS EXTRAS"
separador

# Mostra variáveis de ambiente
echo "48. Principais variáveis de ambiente:"
env | grep -E "^(HOME|USER|SHELL|PATH)="
echo ""

# Mostra alias definidos
echo "49. Aliases definidos:"
alias
echo ""

# Mostra histórico de comandos
echo "50. Últimos 5 comandos do histórico:"
history 5
echo ""

# RESUMO E FINALIZAÇÃO
separador
echo "              SCRIPT FINALIZADO COM SUCESSO!        "
separador
echo ""
echo "📊 RESUMO DA EXECUÇÃO:"
echo "• Total de comandos executados: 50"
echo "• Sistema: Ubuntu $(lsb_release -sc 2>/dev/null || echo 'desconhecido')"
echo "• Usuário: $USER"
echo "• Data/Hora: $(date '+%d/%m/%Y %H:%M:%S')"
echo "• Diretório atual: $(pwd)"
echo ""
separador
echo "    OBRIGADO POR UTILIZAR O SCRIPT UBUNTU!    "
separador

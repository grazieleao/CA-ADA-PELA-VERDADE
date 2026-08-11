# 📓 Notas do Projeto: EquinoxMed

> **Visão Geral:** Este repositório contém a implementação do **EquinoxMed**, um Portal Cativo (Captive Portal) voltado para o ambiente hospitalar. O sistema atua como um gateway de autenticação de rede, interceptando o tráfego de usuários até que eles se autentiquem, validem suas credenciais ou aceitem os termos de uso da rede do hospital.

---

## 🎓 Contexto Acadêmico
Este projeto foi desenvolvido de forma colaborativa com colegas de equipe durante o curso de Tecnologia em **Análise e Desenvolvimento de Sistemas (ADS)** no **Instituto Federal do Pará (IFPA) - Campus Óbidos**.

---

## 🛠️ Stack Tecnológico

*   **Backend:** Python (Flask/Framework WSGI nativo)
*   **Frontend:** HTML5, CSS3, JavaScript (Vanilla)
*   **Controle de Dependências:** `requirements.txt`
*   **Serviços Mapeados:** Autenticação de Rede, Gerenciamento de Sessão, Registro de Funcionários/Usuários.

---

## 🏗️ Arquitetura e Módulos Principais

O sistema é gerido através de um módulo core (`hospital_captive_portal.py`), que orquestra as seguintes rotas e lógicas:

1.  **Portal de Interceptação (Captive Portal):** Redireciona o usuário recém-conectado à rede para a tela de seleção de perfil.
2.  **Módulo de Autenticação:** Separação lógica entre fluxos de login para diferentes entidades (`teladelogin.html`).
3.  **Módulo de Cadastro e Termos:** Fluxo de criação de contas (Funcionários/Visitantes) condicionado ao aceite de normas (`Termos.html`).
4.  **Painel de Administração:** Interface de gestão e controle de usuários logados e autorizados na rede (`controleusuario.html`, `painel_usuario.html`).

---

## 📸 Interface e Telas (Placeholders)

### 1. Tela de Seleção (Gateway Inicial)
*(O usuário conecta no Wi-Fi e é apresentado a esta tela)*
<div align="center">
  <img src="static/img/logocomfundo.png" alt="Logo EquinoxMed" width="200"/>
  <br>
  <!-- Adicione a captura de tela da página 'teladeselecao.html' aqui -->
  <code>[ ESPAÇO PARA SCREENSHOT: teladeselecao.html ]</code>
</div>

### 2. Fluxo de Autenticação e Termos
*(Interface onde as políticas do hospital são validadas)*
<div align="center">
  <!-- Adicione a captura de tela da página 'teladelogin.html' e 'Termos.html' aqui -->
  <code>[ ESPAÇO PARA SCREENSHOT: teladelogin.html ]</code>
</div>

### 3. Painel de Controle de Usuários
*(Visão gerencial para controle de acesso à rede)*
<div align="center">
  <!-- Adicione a captura de tela da página 'controleusuario.html' aqui -->
  <code>[ ESPAÇO PARA SCREENSHOT: controleusuario.html ]</code>
</div>

---

## 🚀 Como Executar o Ambiente de Desenvolvimento

**1. Clone e Preparação do Ambiente**
```bash
# Clone o repositório
git clone <url-do-repositorio>
cd EquinoxMed

# Recomenda-se o uso de um ambiente virtual
python -m venv venv
source venv/bin/activate  # ou venv\Scripts\activate no Windows
```

**2. Instalação de Dependências**
```bash
pip install -r requirements.txt
```

**3. Inicialização do Servidor**
```bash
python hospital_captive_portal.py
```
*O servidor estará escutando as requisições, simulando a captura de tráfego de rede para redirecionamento ao painel.*

<img width="1476" height="1026" alt="image" src="https://github.com/user-attachments/assets/b9a4c7a3-35d5-4745-adfa-21b5d9e3a718" />

📊 Descrição do Modelo de Dados – Sistema de Gestão de Chamados

O modelo de dados foi estruturado para atender às necessidades de um sistema de suporte técnico, permitindo o registro completo de chamados, bem como o relacionamento entre solicitantes, técnicos, entidades atendidas e grupos técnicos responsáveis.

Entidades Principais
🔹 REQUERENTE
Armazena as informações das pessoas que abrem chamados no sistema.
Cada requerente possui um identificador único e está associado a um ou vários chamados.

🔹 CHAMADO
É a entidade central do modelo, representando o registro de um atendimento ou demanda.
Nela são armazenados dados como:

Tipo e categoria do chamado
Status do atendimento
Datas de abertura, fechamento, atualização e solução
Responsáveis envolvidos (técnico e grupo técnico)
Relações com o requerente e a entidade solicitante
Cada chamado possui chaves estrangeiras que o conectam a todas as demais entidades.

🔹 TECNICO
Contém o cadastro dos técnicos responsáveis pela solução dos chamados.
Um técnico pode estar associado a múltiplos chamados.

🔹 ENTIDADE
Representa a instituição, unidade ou departamento ao qual o requerente pertence.
Permite identificar onde o chamado se originou dentro da organização.

🔹 GRUPO_TECNICO
Agrupa técnicos por especialidade ou área de atuação.
Facilita o encaminhamento e categorização de chamados.

🔗 Relacionamentos

REQUERENTE 1:N CHAMADO – Um requerente pode abrir vários chamados.
TECNICO 1:N CHAMADO – Um técnico pode atender muitos chamados.
ENTIDADE 1:N CHAMADO – Uma entidade pode ser origem de múltiplos chamados.
GRUPO_TECNICO 1:N CHAMADO – Um grupo técnico pode ser responsável por vários chamados.

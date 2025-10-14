WITH CTE AS (
    SELECT
  tecnico_completo,  
  requerente,  
  requerente_completo,  
  tipo,  
  id_chamado,  
  entidade_completa,  
  data_abertura,  
  data_fechamento,  
  data_modificacao,
    data_solucao AS SLA_Solucao,
    data_abertura AS SLA_Abertura,
  entidade,  
  categoria,  
  status,  
  grupo_tecnico_completo,  
  grupo_tecnico,  
  grupo_tecnico AS 'Fila',
    CASE 
      WHEN grupo_tecnico IN ('Arquitetura', 'DevOps') THEN 'DevOps'
      WHEN grupo_tecnico IN ('Desenvolvimento - ID', 'Desenvolvimento - CNH', 'Componentes', 'Intaglio', 'funcional', 'Abis', 'Componentes Cloud') THEN 'Desenvolvimento'
      WHEN grupo_tecnico = 'Identidade e Acessos' THEN 'Identidade e Acessos'
      WHEN grupo_tecnico = 'Cyber Security' THEN 'Cyber Security'
      WHEN grupo_tecnico = 'Backup - Infraestrutura' THEN 'Backup'
      WHEN grupo_tecnico = 'SAC' THEN 'SAC'
      WHEN grupo_tecnico = 'DBA' THEN 'DBA'
      WHEN grupo_tecnico LIKE 'N2%' OR grupo_tecnico = 'Projetos - N2 DF' THEN 'Suporte Técnico'
      WHEN grupo_tecnico = 'Infraestrutura' THEN 'Infraestrutura'
      WHEN grupo_tecnico_completo LIKE 'Atendimento Corp%' THEN 'TI Corporativo'
      WHEN grupo_tecnico LIKE 'N3%' THEN 'Infraestrutura'
      WHEN grupo_tecnico = 'Projetos - N3 DF' THEN 'Infraestrutura'
      WHEN grupo_tecnico = 'Dados e Inteligência Artificial' THEN 'Dados e Inteligência Artificial'
      ELSE NULL
    END AS Area
  FROM  
    sdb_vw_tickets
  WHERE 
    data_abertura > '2024-12-31'
    AND (
      grupo_tecnico IN ('Arquitetura', 'DevOps', 'Infraestrutura', 'Identidade e Acessos', 'Cyber Security', 'Backup - Infraestrutura', 'SAC',
      'DBA','Desenvolvimento - ID', 'Desenvolvimento - CNH', 'Componentes', 'Intaglio', 'funcional', 'Abis', 'Componentes Cloud','Projetos - N2 DF','Projetos - N3 DF','Dados e Inteligência Artificial') OR
      grupo_tecnico LIKE 'N2%' OR
      grupo_tecnico LIKE 'N3%' OR
      grupo_tecnico_completo LIKE 'Atendimento Corp%'
    )
)

SELECT * 
FROM CTE
WHERE Fila IS NOT NULL;
-- consulta que ordena pelas horas totais
WITH UltimosRegistros AS (
    SELECT 
        ID_ALUNO,
        HORAS_TOTAIS,
        HORAS_SEMANAIS,
        CLASSIFICACAO_TOTAL,
        CLASSIFICACAO_SEMANAL,
        ROW_NUMBER() OVER (PARTITION BY ID_ALUNO ORDER BY ID_RELATORIO DESC) AS rn
    FROM 
        RELATORIO
)
SELECT 
    A.MATRICULA,
    A.NOME,
    R.HORAS_TOTAIS,
    R.HORAS_SEMANAIS,
    R.CLASSIFICACAO_TOTAL,
    R.CLASSIFICACAO_SEMANAL
FROM 
    UltimosRegistros R
INNER JOIN 
    ALUNOS A ON R.ID_ALUNO = A.MATRICULA
WHERE 
    R.rn = 1
ORDER BY 
    CAST(SUBSTRING_INDEX(R.HORAS_TOTAIS, ':', 1) AS UNSIGNED) DESC,  -- Ordena pelas horas totais (parte das horas)
    CAST(SUBSTRING_INDEX(SUBSTRING_INDEX(R.HORAS_TOTAIS, ':', -2), ':', 1) AS UNSIGNED) DESC; -- Ordena os minutos


-- consulta que ordena pelas horas semanais
WITH UltimosRegistros AS (
    SELECT 
        ID_ALUNO,
        HORAS_TOTAIS,
        HORAS_SEMANAIS,
        CLASSIFICACAO_TOTAL,
        CLASSIFICACAO_SEMANAL,
        ROW_NUMBER() OVER (PARTITION BY ID_ALUNO ORDER BY ID_RELATORIO DESC) AS rn
    FROM 
        RELATORIO
)
SELECT 
    A.MATRICULA,
    A.NOME,
    R.HORAS_TOTAIS,
    R.HORAS_SEMANAIS,
    R.CLASSIFICACAO_TOTAL,
    R.CLASSIFICACAO_SEMANAL
FROM 
    UltimosRegistros R
INNER JOIN 
    ALUNOS A ON R.ID_ALUNO = A.MATRICULA
WHERE 
    R.rn = 1
ORDER BY 
    CAST(SUBSTRING_INDEX(R.HORAS_SEMANAIS, ':', 1) AS UNSIGNED) DESC,  -- Ordena pelas horas semanais (parte das horas)
    CAST(SUBSTRING_INDEX(SUBSTRING_INDEX(R.HORAS_SEMANAIS, ':', -2), ':', 1) AS UNSIGNED) DESC; -- Ordena os minutos

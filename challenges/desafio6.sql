SELECT 
  CAST(MIN(plans.valor_plano) AS DECIMAL(3,2)) AS faturamento_minimo,
  CAST(MAX(plans.valor_plano) AS DECIMAL(3,2)) AS faturamento_maximo,
  CAST(AVG(plans.valor_plano) AS DECIMAL(3,2)) AS faturamento_medio,
  CAST(SUM(plans.valor_plano) AS DECIMAL(4,2)) AS faturamento_total
  FROM planos AS plans INNER JOIN usuarios AS user ON plans.plano_id = user.plano_id

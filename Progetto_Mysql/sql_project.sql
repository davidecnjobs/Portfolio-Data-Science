/*
	PROGETTO SQL: Analisi dei clienti di una banca
    
    Il database è costituito dalle seguenti tabelle:
		Cliente: contiene informazioni personali sui clienti (ad esempio, età).
		Conto: contiene informazioni sui conti posseduti dai clienti.
		Tipo_conto: descrive le diverse tipologie di conti disponibili.
		Tipo_transazione: contiene i tipi di transazione che possono avvenire sui conti.
		Transazioni: contiene i dettagli delle transazioni effettuate dai clienti sui vari conti.
        
	NOTE TECNICHE:
    - Uso di LEFT JOIN per includere anche clienti senza transazioni o conti.
    - Uso di COALESCE per sostituire i valori NULL (derivanti dalle LEFT JOIN) con 0.
*/

-- -----------------------------------------------------------------
-- Creazione della Tabella Denormalizzata
-- -----------------------------------------------------------------
select 
	cl.id_cliente,
	cl.nome,
	cl.cognome,	
    
    -- -----------------------------------------------------------------
	-- Indicatore comportamentale base
    -- -----------------------------------------------------------------
    
	timestampdiff(year, cl.data_nascita, current_date()) as eta_cliente,
	
    -- -----------------------------------------------------------------
    -- Indicatori sulle transazioni
    -- -----------------------------------------------------------------
    
	coalesce(sum(case when tt.segno = '-' then 1 else 0 end), 0) as num_transazioni_uscita_totale,
	coalesce(sum(case when tt.segno = '+' then 1 else 0 end), 0) as num_transazioni_entrata_totale,
	coalesce(round(sum(case when tt.segno = '-' then abs(t.importo) else 0 end), 2), 0.00) as importo_totale_uscita,
	coalesce(round(sum(case when tt.segno = '+' then t.importo else 0 end), 2), 0.00) as importo_totale_entrata,
    
	-- -----------------------------------------------------------------
    -- INDICATORI SUI CONTI
    -- -----------------------------------------------------------------
    
    -- Totali Conti
	coalesce(count(distinct co.id_conto), 0) as numero_totale_conti_posseduti,
	-- Numero di conti posseduti per tipologia
	coalesce(sum(case when tc.id_tipo_conto = 0 then 1 else 0 end),0) as num_conti_Conto_base,
	coalesce(sum(case when tc.id_tipo_conto = 1 then 1 else 0 end),0) as num_conti_ContoBusiness,
	coalesce(sum(case when tc.id_tipo_conto = 2 then 1 else 0 end),0) as num_conti_ContoPrivati,
	coalesce(sum(case when tc.id_tipo_conto = 3 then 1 else 0 end),0) as num_conti_ContoFamiglie,

	-- -----------------------------------------------------------------
	-- Indicatori sulle transazioni per tipologia di conto
    -- -----------------------------------------------------------------
    
    -- Conto Base
	coalesce(sum(case when tc.desc_tipo_conto = 'Conto Base' and tt.segno = '-' then 1 else 0 end), 0) as num_uscita_ContoBase,
	coalesce(round(sum(case when tc.desc_tipo_conto = 'Conto Base' and tt.segno = '-' then abs(t.importo) else 0 end), 2), 0.0) as importo_uscita_ContoBase,
	coalesce(sum(case when tc.desc_tipo_conto = 'Conto Base' and tt.segno = '+' then 1 else 0 end), 0) as num_entrata_ContoBase,
	coalesce(round(sum(case when tc.desc_tipo_conto = 'Conto Base' and tt.segno = '+' then t.importo else 0 end), 2), 0.0) as importo_entrata_ContoBase,
	
    -- Conto Business
	coalesce(sum(case when tc.desc_tipo_conto = 'Conto Business' and tt.segno = '-' then 1 else 0 end), 0) as num_uscita_ContoBusiness,
	coalesce(round(sum(case when tc.desc_tipo_conto = 'Conto Business' and tt.segno = '-' then abs(t.importo) else 0 end), 2), 0.0) as importo_uscita_ContoBusiness,
	coalesce(sum(case when tc.desc_tipo_conto = 'Conto Business' and tt.segno = '+' then 1 else 0 end), 0) as num_entrata_ContoBusiness,
	coalesce(round(sum(case when tc.desc_tipo_conto = 'Conto Business' and tt.segno = '+' then t.importo else 0 end), 2), 0.0) as importo_entrata_ContoBusiness,
	
    -- Conto Privati
	coalesce(sum(case when tc.desc_tipo_conto = 'Conto Privati' and tt.segno = '-' then 1 else 0 end), 0) as num_uscita_ContoPrivati,
	coalesce(round(sum(case when tc.desc_tipo_conto = 'Conto Privati' and tt.segno = '-' then abs(t.importo) else 0 end), 2), 0.0) as importo_uscita_ContoPrivati,
	coalesce(sum(case when tc.desc_tipo_conto = 'Conto Privati' and tt.segno = '+' then 1 else 0 end), 0) as num_entrata_ContoPrivati,
	coalesce(round(sum(case when tc.desc_tipo_conto = 'Conto Privati' and tt.segno = '+' then t.importo else 0 end), 2), 0.0) as importo_entrata_ContoPrivati,
	
    -- Conto Famiglie
	coalesce(sum(case when tc.desc_tipo_conto = 'Conto Famiglie' and tt.segno = '-' then 1 else 0 end), 0) as num_uscita_ContoFamiglie,
	coalesce(round(sum(case when tc.desc_tipo_conto = 'Conto Famiglie' and tt.segno = '-' then abs(t.importo) else 0 end), 2), 0.0) as importo_uscita_ContoFamiglie,
	coalesce(sum(case when tc.desc_tipo_conto = 'Conto Famiglie' and tt.segno = '+' then 1 else 0 end), 0) as num_entrata_ContoFamiglie,
	coalesce(round(sum(case when tc.desc_tipo_conto = 'Conto Famiglie' and tt.segno = '+' then t.importo else 0 end), 2), 0.0) as importo_entrata_ContoFamiglie
    
from 
	banca.cliente cl
left join 
	banca.conto co on cl.id_cliente = co.id_cliente
left join 
	banca.tipo_conto tc on co.id_tipo_conto = tc.id_tipo_conto
left join 
	banca.transazioni t on co.id_conto = t.id_conto
left join 
	banca.tipo_transazione tt on t.id_tipo_trans = tt.id_tipo_transazione
group by 
	1,2,3,4 
order by 1;
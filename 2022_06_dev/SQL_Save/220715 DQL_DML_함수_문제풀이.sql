
-- 置曽 叔柔 庚薦
-- 庚薦1. 
-- 脊紫析戚 5鰍 戚雌, 10鰍 戚馬昔 送据税 戚硯,爽肯腰硲,厭食,脊紫析聖 伊事馬食虞
select emp_name, emp_no, salary, hire_date from employee
where (sysdate-hire_date)/365 between 5 and 10;


-- 庚薦2.
-- 仙送掻戚 焼観 送据税 戚硯,採辞坪球, 壱遂析, 悦巷奄娃, 盗送析聖 伊事馬食虞 
--(盗紫 食採 : ENT_YN)

select emp_name, dept_code,hire_date, ent_date-hire_date, ent_date from employee
where ent_yn = 'Y';


-- 庚薦3.
-- 悦紗鰍呪亜 10鰍 戚雌昔 送据級聖 伊事馬食
-- 窒径 衣引澗 戚硯,厭食,悦紗鰍呪(社呪繊X)研 悦紗鰍呪亜 神硯託授生稽 舛慶馬食 窒径馬食虞
-- 舘, 厭食澗 50% 昔雌吉 厭食稽 窒径鞠亀系 馬食虞.
select emp_name, salary*1.5, floor((sysdate-hire_date)/365) from employee
where floor((sysdate-hire_date)/365) >=10;




-- 庚薦4.
-- 脊紫析戚 99/01/01 ~ 10/01/01 昔 紫寓 掻拭辞 厭食亜 2000000 据 戚馬昔 紫寓税
-- 戚硯,爽肯腰硲,戚五析,肉腰硲,厭食研 伊事 馬獣神

select emp_name, emp_no, email, phone, salary from employee
where (hire_date between '990101' and '100101') and salary <=2000000;

-- 庚薦5.
-- 厭食亜 2000000据 ~ 3000000据 昔 食送据 掻拭辞 4杉 持析切研 伊事馬食 
-- 戚硯,爽肯腰硲,厭食,採辞坪球研 爽肯腰硲 授生稽(鎧顕託授) 窒径馬食虞
-- 舘, 採辞坪球亜 null昔 紫寓精 採辞坪球亜 '蒸製' 生稽 窒径 馬食虞.

select emp_name, emp_no, salary, nvl(dept_code,'蒸製') from employee
where (salary between 2000000 and 3000000) and
substr(emp_no,8,1) in (2,4)
order by emp_no desc;


-- 庚薦6.
-- 害切 紫据 掻 左格什亜 蒸澗 紫据税 神潅猿走 悦巷析聖 著舛馬食 
-- 1000析 原陥(社呪繊 薦須) 
-- 厭食税 10% 左格什研 域至馬食 戚硯,働紺 左格什 (域至 榎衝) 衣引研 窒径馬食虞.
-- 舘, 戚硯 授生稽 神硯 託授 舛慶馬食 窒径馬食虞.

select emp_name, floor((sysdate-hire_date)/1000)*0.1*salary "働紺左格什", salary, floor((sysdate-hire_date)/1000), hire_date

from employee
where substr(emp_no,8,1) in (1,3)
order by emp_name;



-- @敗呪 置曽叔柔庚薦
--1. 送据誤引 戚五析 , 戚五析 掩戚研 窒径馬獣神
--		  戚硯	    戚五析		戚五析掩戚
--	ex) 	畠掩疑 , hong@kh.or.kr   	 
select emp_name "戚硯", email "戚五析", length(email)"戚五析掩戚" from employee;



--2. 送据税 戚硯引 戚五析 爽社掻 焼戚巨 採歳幻 窒径馬獣神
--	ex) 葛針旦	no_hc
--	ex) 舛掻馬	jung_jh

select emp_name, substr(email,1,instr(email,'@',1,1)-1) from employee;




--3. 60鰍企拭 殿嬢貝 送据誤引 鰍持, 左格什 葵聖 窒径馬獣神. 益凶 左格什 葵戚 null昔 井酔拭澗 0 戚虞壱 窒径 鞠惟 幻球獣神
--	    送据誤    鰍持      左格什
--	ex) 識疑析	    1962	    0.3
--	ex) 勺精費	    1963  	    0

select emp_name"戚硯", extract(year from to_date(substr(emp_no,1,6)))"鰍持" , nvl(bonus,0)"左格什" from employee
where extract(year from to_date(substr(emp_no,1,6))) between '1960' and '1969';


--4. '010' 輩球肉 腰硲研 床走 省澗 紫寓税 呪研 窒径馬獣神 (及拭 舘是澗 誤聖 細戚獣神)
--	   昔据
--	ex) 3誤
select count(*)||'誤' "昔据" from employee
where phone not like '010%'; 


--5. 送据誤引 脊紫鰍杉聖 窒径馬獣神 
--	舘, 焼掘人 旭戚 窒径鞠亀系 幻級嬢 左獣神
--	    送据誤		脊紫鰍杉
--	ex) 穿莫儀		2012鰍 12杉
--	ex) 穿走尻		1997鰍 3杉
select emp_name"送据誤", to_char(hire_date,'YYYY"鰍" MM"杉"')"脊紫鰍杉" from employee;


--6. 送据誤引 爽肯腰硲研 繕噺馬獣神
--	舘, 爽肯腰硲 9腰属 切軒採斗 魁猿走澗 '*' 庚切稽 辰趨辞窒径 馬獣神
--	ex) 畠掩疑 771120-1******

select emp_name, rpad(substr(emp_no,1,8),14,'*') from employee;


--7. 送据誤, 送厭坪球, 尻裟(据) 繕噺
--  舘, 尻裟精 ��57,000,000 生稽 妊獣鞠惟 敗
--     尻裟精 左格什匂昔闘亜 旋遂吉 1鰍帖 厭食績

select emp_name, job_code, to_char(salary*12+salary*nvl(bonus,0),'l999,999,999')"尻裟" from employee;


--8. 採辞坪球亜 D5, D9昔 送据級 掻拭辞 2004鰍亀拭 脊紫廃 送据掻拭 繕噺敗.
--   紫腰 紫据誤 採辞坪球 脊紫析
select emp_id, emp_name, dept_code, hire_date from employee
where dept_code in ('D5','D9') and extract(year from hire_date) = '2004';


--9. 送据誤, 脊紫析, 神潅猿走税 悦巷析呪 繕噺 
--	* 爽源亀 匂敗 , 社呪繊 焼掘澗 獄顕

select emp_name, hire_date,floor(sysdate-hire_date) from employee;


--10. 送据誤, 採辞坪球, 持鰍杉析, 蟹戚(幻) 繕噺
--   舘, 持鰍杉析精 爽肯腰硲拭辞 蓄窒背辞, 
--   しししし鰍 しし杉 しし析稽 窒径鞠惟 敗.
--   蟹戚澗 爽肯腰硲拭辞 蓄窒背辞 劾促汽戚斗稽 痕発廃 陥製, 域至敗
--	* 爽肯腰硲亜 戚雌廃 紫寓級精 薦須獣徹壱 遭楳 馬亀系(200,201,214 腰 薦須)
--	* HINT : NOT IN 紫遂

select emp_name, dept_code, to_char(to_date(substr(emp_no,1,6)),'YYYY"鰍 "MM"杉 "DD"析"') from employee
where emp_id not in (200,201,214);




--11. 紫据誤引, 採辞誤聖 窒径馬室推.
--   採辞坪球亜 D5戚檎 恥巷採, D6戚檎 奄塙採, D9戚檎 慎穣採稽 坦軒馬獣神.(case 紫遂)
--   舘, 採辞坪球亜 D5, D6, D9 昔 送据税 舛左幻 繕噺馬壱, 採辞坪球 奄層生稽 神硯託授 舛慶敗.

select emp_name, 
case when dept_code = 'D5' then '恥巷採'
when dept_code = 'D6' then '奄塙採'
when dept_code = 'D9' then '慎穣採' end
from employee
where dept_code in ('D5','D6','D9')
order by dept_code;



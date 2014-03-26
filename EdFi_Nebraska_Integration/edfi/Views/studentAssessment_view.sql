





CREATE view [edfi].[studentAssessment_view] as 
	

WITH studentAssessment AS (

SELECT distinct SA.*
,ARMTT.Description AS ASS_AssessmentReportingMethodTypeId,
SASR.Result AS ASSESSMENT_RESULT,
ACT.Description
,SAT.AssessmentResponse
,RIT.Description [ResponseIndicator]
,AIRT.Description [AssessmentItemResult]
,AI.IdentificationCode AssessmentItemIdentificationCode
,row_number () over (order by  SA.StudentUSI
      ,SAT.AssesmentItem
      ,SA.AssessmentTitle
      ,SA.AcademicSubjectTypeId
      ,SA.AssessedGradeLevelTypeId
      ,SA.Version
      ,SA.AdministrationDate)Rownum


FROM  TSDS_GlendaleISD_EdFi_PublicDemo.edfi.StudentAssessment SA  JOIN [TSDS_GlendaleISD_EdFi_PublicDemo].edfi.CurrentStudentSchoolAssociation SSA ON
SSA.StudentUSI=SA.StudentUSI 

LEFT JOIN TSDS_GlendaleISD_EdFi_PublicDemo.[edfi].[StudentAssessmentItem] SAT ON 
SA.StudentUSI=SAT.StudentUSI 
AND SA.AdministrationDate=SAT.AdministrationDate 
AND SA.AssessmentTitle=SAT.AssessmentTitle 
AND SA.AssessedGradeLevelTypeId=SAT.AssessedGradeLevelTypeId 
AND SA.AcademicSubjectTypeId=SAT.AcademicSubjectTypeId 
AND SA.Version=SAT.Version

JOIN TSDS_GlendaleISD_EdFi_PublicDemo.[edfi].[AssessmentItem] AI ON 
AI.AssesmentItem =SAT.AssesmentItem 
AND AI.AssessmentTitle=SAT.AssessmentTitle 
AND AI.AssessedGradeLevelTypeId=SAT.AssessedGradeLevelTypeId 
AND AI.AcademicSubjectTypeId=SAT.AcademicSubjectTypeId 
AND AI.Version=SAT.Version

Join TSDS_GlendaleISD_EdFi_PublicDemo.edfi.ResponseIndicatorType RIT on 
Rit.ResponseIndicatorTypeId=SAT.ResponseIndicatorTypeId

Join TSDS_GlendaleISD_EdFi_PublicDemo.edfi.AssessmentItemResultType AIRT On
AIRT.AssessmentItemResultTypeId=SAT.AssessmentItemResultTypeId


LEFT JOIN TSDS_GlendaleISD_EdFi_PublicDemo.edfi.StudentAssessmentScoreResult SASR ON 
SA.StudentUSI=SASR.StudentUSI 
AND SA.AdministrationDate=SASR.AdministrationDate 
AND SA.AssessmentTitle=SASR.AssessmentTitle 
AND SA.AssessedGradeLevelTypeId=SASR.AssessedGradeLevelTypeId 
AND SA.AcademicSubjectTypeId=SASR.AcademicSubjectTypeId 
AND SA.Version=SASR.Version


LEFT JOIN TSDS_GlendaleISD_EdFi_PublicDemo.EDFI.AssessmentReportingMethodType ARMTT 
ON ARMTT.AssessmentReportingMethodTypeID=SASR.AssessmentReportingMethodTypeId

LEFT JOIN TSDS_GlendaleISD_EdFi_PublicDemo.edfi.Assessment SAI 
ON   SA.AssessmentTitle=SAI.AssessmentTitle 
AND SA.AssessedGradeLevelTypeId=SAI.AssessedGradeLevelTypeId 
AND SA.AcademicSubjectTypeId=SAI.AcademicSubjectTypeId 
AND SA.Version=SAI.Version
inner join TSDS_GlendaleISD_EdFi_PublicDemo.edfi.AssessmentCategoryType ACT 
ON ACT.AssessmentCategoryTypeId=SAI.AssessmentCategoryTypeId

where ACT.AssessmentCategoryTypeID=2 AND  -- EXTRACT NON BENCHMARK assessment
SSA.schoolid not in (867530153,867530154,867530156,867530157,867530158,867530159,867530160,867530161,867530162,867530164,867530165,
867530168,867530170,867530171,867530172,867530173,867530177,867530179,867530180,867530181,867530182,867530184,867530185,867530186,
867530189,867530191) and SSA.StudentUSI NOT IN (100040592,100054707,100060330,100062325,100062447,100062472,100062514,100062552,100063310,
100063347,100063350,100063368,100063844,100066073,100066093,100066418,100066445,100066467,100066699,100066771,100066833,100066845,100066901,
100066981,100067016,100067154,100067181,100067230,100067248,100067453,100067491,100067533,100067538,100067605,100067619,100067652,100067686,
100067828,100068065,100068091,100068236,100068301,100068320,100068425,100068440,100068469,100068610,100068629,100068806,100068867,100069136,
100069172,100069186,100069384,100069492,100069792,100069950,100070272,100070881,100070927,100070979,100071185,100071188,
100071226,100071301,100071428,100071620,100071681,100071697,100071794,100071837,100071933,100072052,100072280,100072371,100072489,100072532,
100072538,100072596,100072622,100072752,100072850,100072890,100073002,100073008,100073034,100073538,100073714,100074192,100077505,
100074198,100074292,100074498,100074945,100075991,100076253,100076284,100076580,100076690,100076749,100076884,100077289,100077375,100077449,100077667,
100077742,100077830,100077873,100078022,100078125,100078130,100078390,100078458,100078557,100078643,100078647,100078985,100078988,100079269,
100079357,100079460,100079485,100079503,100080117,100080125,100080138,100080813,100081260,100081335,100081748,100081870,100077734,100084852
,100082167,100082378,100082390,100082501,100082574,100082595,100082785,100082947,100083054,100083542,100083573,100083765,100083977,100084618,100084847,100085277,
100087014,100087093,100087813,100088194,100088196,100088249,100088617,
100088667,100088823,100089149,100090263,100090385,100090540,100091850,100092290,100092563,100092717,100093049,100094393,100094446,100094496,100095573,100096590,
100097179,100097318,100097731,100099120,100099711,100100053,100100118,100100998,100104083,100107431,100111833,
100112757,100115987,100120372,100125013,100125660,100126524,100126958,100127221,100130919,100132125,100132515,100132637,100134425,
100136306,100136417,100136703,100138398,100139715,100141464,100141646) 
and SA.AssessedGradeLevelTypeId=4
)
, BenchmarkAssessment as (
SELECT DISTINCT 
     Case when rownum <= '10000' then '01'
     when rownum between '10001' and '20000' then '02' 
     When rownum between '20001' and '30000' then '03' 
     When rownum between '30001' and '40000' then '04' 
	 When rownum between '40001' and '50000' then '05' 
	 When rownum between '50001' and '60000' then '06' 
	 When rownum between '60001' and '70000' then '07' 
	 When rownum between '70001' and '80000' then '08'
	 When rownum between '80001' and '90000' then '09'
	 When rownum between '90001' and '100000' then '10'
	 When rownum between '100000' and '110000' then '11'
     when rownum between '110001' and '120000' then '12' 
     When rownum between '120001' and '130000' then '13' 
     When rownum between '130001' and '140000' then '14' 
	 When rownum between '140001' and '150000' then '15' 
	 When rownum between '150001' and '160000' then '16' 
	 When rownum between '160001' and '170000' then '17' 
	 When rownum between '170001' and '180000' then '18'
	 When rownum between '180001' and '190000' then '19'
	 When rownum between '190001' and '200000' then '20'
	 When rownum between '200000' and '210000' then '21'
	 when rownum between '210001' and '220000' then '22' 
     When rownum between '220001' and '230000' then '23' 
     When rownum between '230001' and '240000' then '24' 
	 When rownum between '240001' and '250000' then '25' 
	 When rownum between '250001' and '260000' then '26' 
	 When rownum between '260001' and '270000' then '27' 
	 When rownum between '270001' and '280000' then '28'
	 When rownum between '280001' and '290000' then '29'
	 When rownum between '290001' and '300000' then '30'
	 When rownum between '300000' and '310000' then '31'
	 when rownum between '310001' and '320000' then '32' 
     When rownum between '320001' and '330000' then '33' 
     When rownum between '330001' and '340000' then '34' 
	 When rownum between '340001' and '350000' then '35' 
	 When rownum between '350001' and '360000' then '36' 
	 When rownum between '360001' and '370000' then '37' 
	 When rownum between '370001' and '380000' then '38'
	 When rownum between '380001' and '390000' then '39'
	 When rownum between '390001' and '400000' then '40'
	 When rownum between '400000' and '410000' then '41'
	 when rownum between '410001' and '420000' then '42' 
     When rownum between '420001' and '430000' then '43' 
     When rownum between '430001' and '440000' then '44' 
	 When rownum between '440001' and '450000' then '45' 
	 When rownum between '450001' and '460000' then '46' 
	 When rownum between '460001' and '470000' then '47' 
	 When rownum between '470001' and '480000' then '48'
	 When rownum between '480001' and '490000' then '49'
	 Else '50' End as FileNO,
	 

[StudentUSI]
,[AssessmentTitle]
,[AcademicSubjectTypeId]
,[AssessedGradeLevelTypeId]
,[Version]
,Description AS AssessmentCategoryTypE
,[AdministrationDate]
,AdministrationEndDate,
SerialNumber,
AdministrationLanguageTypeId,
AdministrationEnvironmentTypeId,
RetestIndicatorTypeId,
ReasonNotTestedTypeId,
WhenAssessedGradeLevelTypeId
,ASS_AssessmentReportingMethodTypeId
,ASSESSMENT_RESULT
,AssessmentResponse
,[ResponseIndicator]
, [AssessmentItemResult]
, AssessmentItemIdentificationCode
FROM studentAssessment
)

select *
from BenchmarkAssessment
where studentusi=100090951 --and assessmenttitle 
and academicsubjecttypeid=2
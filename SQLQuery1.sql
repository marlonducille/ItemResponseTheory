/****** Script for SelectTopNRows command from SSMS  ******/
SELECT CourseName, CourseInstanceID,
[LearningObjectivesMet]
      ,[CourseMaterialsUseful]
      ,[RateQualityOfMaterials]
      ,[RateInstructorKnowledge]
      ,[ContentPresentationClear]
      ,[TimeUsedEffectively]
      ,[AbleToUseKnowledge]
      ,[OverallReaction]
  FROM [Training].[dbo].[tblCourseEvaluation] e
  inner join [dbo].[tblCourseInstance] i on i.CourseInstanceID = e.CourseInstanceID_fk
  inner join [dbo].[tblCourse] c on c.CourseID = i.CourseID_fk
  inner join [dbo].[tblCourseType] t on t.CourseTypeID = c.CourseTypeID_fk
  group by CourseInstanceID, CourseName, [LearningObjectivesMet]
      ,[CourseMaterialsUseful]
      ,[RateQualityOfMaterials]
      ,[RateInstructorKnowledge]
      ,[ContentPresentationClear]
      ,[TimeUsedEffectively]
      ,[AbleToUseKnowledge]
      ,[OverallReaction], [Type]
  having [Type] = 'ICT Courses'
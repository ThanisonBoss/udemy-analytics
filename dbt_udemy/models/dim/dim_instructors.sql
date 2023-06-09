WITH SRC_COURSES AS
	(SELECT jsonb_array_elements(VISIBLE_INSTRUCTORS) AS VISIBLE_INSTRUCTORS 
		FROM {{ ref('src_courses') }})
SELECT DISTINCT ON (visible_instructors->>'id')
	   CAST(visible_instructors->>'id' AS INTEGER) AS instructor_id_pk,
	   visible_instructors->>'title' AS title,
	   visible_instructors->>'name' AS name,
	   visible_instructors->>'display_name' AS display_name,
	   visible_instructors->>'job_title' AS job_title,
	   visible_instructors->>'image_100x100' AS image_url,
	   visible_instructors->>'initials' AS initials,
	   visible_instructors->>'url' AS user_url
FROM SRC_COURSES
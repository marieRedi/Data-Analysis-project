--check upcoming and completed projects status by assigning new field

with project_status as
(
select project_id, project_name,project_budget, 'upcoming' as status
from dbo.upcoming_projects

union all

select  project_id, project_name,project_budget, 'completed' as status
from dbo.completed_projects
)
--big table
select e.employee_id,e.first_name,e.last_name,e.job_title,e.salary,d.Department_Name,pa.project_id, p.project_name,p.status
from [dbo].[employees] e
join [dbo].[departments] d
on e.department_id = d.Department_ID
join [dbo].project_assignments  pa
on pa.employee_id = e.employee_id
join project_status p
on p.project_id = pa.project_id
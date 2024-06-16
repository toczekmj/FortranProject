program TaskManager
    character(len=1000), dimension(:), allocatable :: tasks 
    character(len=1000) :: new_task 
    integer :: num_tasks, current_task, ios 
    character :: user_input 
    
    call load_tasks("tasks.txt", tasks, num_tasks)  
    current_task = 1  

    do
        call display_tasks(tasks, num_tasks, current_task)  
        read(*, '(A1)', iostat=ios) user_input  

        if (ios /= 0) then
            print *, "Incorrect. Try again!"
            cycle
        end if
        
        select case (user_input)
            case ('J', 'j')   
                if (current_task > 1) current_task = current_task - 1
            case ('K', 'k')   
                if (current_task < num_tasks) current_task = current_task + 1
                user_input = ''
            case ('E', 'e')   
                call edit_task(tasks, current_task)
            case ('R', 'r')   
                call delete_task(tasks, num_tasks, current_task)
            case ('N', 'n')   
                print *, 'Create new task:'
                read (*, '(A)', iostat=ios) new_task
                call add_task(tasks, num_tasks, new_task)
            case ('S', 's')   
                call save_tasks("tasks.txt", tasks, num_tasks)
            case ('W', 'w')   
                exit
            case ('Q', 'q')   
                call save_tasks("tasks.txt", tasks, num_tasks)
                exit
        end select
    end do
contains

     
    subroutine load_tasks(filename, tasks, num_tasks)
        character(len=*), intent(in) :: filename
        character(len=1000), dimension(:), allocatable :: tasks
        integer, intent(out) :: num_tasks
        integer :: ios, unit
        character(len=1000), dimension(:), allocatable :: temp_tasks

        unit = 10
         
        open(unit, file=filename, status='old', action='read', iostat=ios)
        if (ios /= 0) then
            allocate(tasks(0))
            num_tasks = 0
            return
        end if
        
        allocate(temp_tasks(1000))  
        num_tasks = 0

        do   
            read(unit, '(A)', iostat=ios) temp_tasks(num_tasks+1)
            
            if (ios /= 0) then
                tasks = temp_tasks
                exit
            end if

            num_tasks = num_tasks + 1 
            if (num_tasks == size(temp_tasks)) then  
                call resize(temp_tasks, size(temp_tasks) + 1000)
            end if
        end do

        close(unit)
    end subroutine load_tasks

    subroutine resize(array, new_size)
        character(len=1000), dimension(:), allocatable :: array
        character(len=1000), dimension(:), allocatable :: temp
        integer, intent(in) :: new_size 
        
        allocate(temp(new_size)) 
        temp = array
        call move_alloc(temp, array)
    end subroutine resize


    subroutine save_tasks(filename, tasks, num_tasks)  
        character(len=*), intent(in) :: filename
        character(len=1000), dimension(:), intent(in) :: tasks
        integer, intent(in) :: num_tasks
        integer :: unit, i

        unit = 10
        open(unit, file=filename, status='replace', action='write')  
        do i = 1, num_tasks
            write(unit, '(A)') trim(tasks(i))
        end do
        close(unit)
    end subroutine save_tasks

    subroutine display_tasks(tasks, num_tasks, current_task)
        character(len=1000), dimension(:), intent(in) :: tasks
        integer, intent(in) :: num_tasks
        integer :: i, current_task

        call system("clear")  
        print *, '======================TODO LIST======================'
        print *, '=                 j - move down                     ='
        print *, '=                 k - move up                       ='
        print *, '=                 n - new task                      ='
        print *, '=                 e - edit task                     ='
        print *, '=                 r - remove task                   ='
        print *, '=                 s - save tasks                    ='
        print *, '=                 q - save and quit                 ='
        print *, '=                 w - quit without saving           ='
        print *, '========================TASKS========================'

        do i = 1, num_tasks
            if (i == current_task) then  
                print *, '*', trim(tasks(i)) 
            else
                print *, '-', trim(tasks(i))
            end if
        end do
    end subroutine display_tasks

    subroutine edit_task(tasks, current_task)  
        character(len=1000), dimension(:), intent(inout) :: tasks
        integer, intent(in) :: current_task
        character(len=1000) :: new_task

        if ( current_task == 0 ) then
            return 
        end if 

        print *, 'Edit task:' 
        read(*, '(A)') new_task
        tasks(current_task) = new_task  
    end subroutine edit_task

    subroutine delete_task(tasks, num_tasks, current_task) 
        character(len=1000), dimension(:), allocatable, intent(inout) :: tasks
        integer, intent(inout) :: num_tasks, current_task
        integer :: i

        if (num_tasks == 0) return  

        do i = current_task, num_tasks-1  
            tasks(i) = tasks(i+1)
        end do
        num_tasks = num_tasks - 1  
        if (current_task > num_tasks) current_task = num_tasks  
        if (num_tasks == 0) then  
            deallocate(tasks)  
            allocate(tasks(0))
        else
            call resize(tasks, num_tasks)  
        end if
    end subroutine delete_task

    subroutine add_task(tasks, num_tasks, new_task)
        character(len=1000), dimension(:), allocatable, intent(inout) :: tasks
        character(len=1000), dimension(:), allocatable :: new_tasks
        integer, intent(inout) :: num_tasks
        character(len=1000), intent(in) :: new_task

        num_tasks = num_tasks + 1
        allocate(new_tasks(num_tasks))  
        if (allocated(tasks)) then  
            new_tasks(1:num_tasks-1) = tasks
            call move_alloc(new_tasks, tasks)
        else  
            allocate(tasks(1))
        end if
        tasks(num_tasks) = new_task  
        if(current_task == 0) then
            current_task = 1
        end if
    end subroutine add_task
end program TaskManager

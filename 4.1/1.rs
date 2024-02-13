use std::collections::VecDeque;

struct Task {
    name: String,
    clock: u64,
}

struct TaskList {
    tasks: VecDeque<Task>,
}

impl TaskList {
    fn add_task(&mut self, name: String, clock: u64) {
        let task = Task { name, clock };
        self.tasks.push_back(task);
    }

    fn consume_task(&mut self) -> Option<Task> {
        self.tasks.pop_front()
    }
}

fn main() {
    let mut task_list = TaskList { tasks: VecDeque::new() };
}
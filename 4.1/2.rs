use std::collections::VecDeque;
use std::fs::File;
use std::io::{BufRead, BufReader};
use serde::{Deserialize};

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

    fn load_from_file(&mut self, filename: &str) {
        if let Ok(file) = File::open(filename) {
            let reader = BufReader::new(file);
            for line in reader.lines() {
                if let Ok(line) = line {
                    if let Ok(task) = serde_yaml::from_str::<Task>(&line) {
                        self.add_task(task.name, task.clock);
                    }
                }
            }
        }
    }

    fn generate_random_tasks(&mut self, num_tasks: usize) {
        use rand::Rng;

        let mut rng = rand::thread_rng();

        for _ in 0..num_tasks {
            let name = format!("Task{}", rng.gen_range(1..=100));
            let clock = rng.gen_range(1..=20);
            self.add_task(name, clock);
        }
    }
}

fn main() {
    let mut task_list = TaskList { tasks: VecDeque::new() };

    task_list.generate_random_tasks(5);

    while let Some(task) = task_list.consume_task() {
        println!("Task: {} Clock: {}", task.name, task.clock);
    }
}
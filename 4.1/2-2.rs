use std::collections::VecDeque;
use std::fs::File;
use std::io::{self, BufReader};
use serde::{Deserialize, Serialize};

#[derive(Debug, Deserialize, Serialize)]
struct Task {
    name: String,
    clock: u64,
}

#[derive(Debug, Deserialize, Serialize)]
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

    fn load_from_file(file_path: &str) -> io::Result<TaskList> {
        let file = File::open(file_path)?;
        let reader = BufReader::new(file);
        let task_list: TaskList = serde_yaml::from_reader(reader)?;

        Ok(task_list)
    }
}

fn main() {
    let mut task_list = TaskList { tasks: VecDeque::new() };

    // Level 1: タスクの追加と消費の例
    task_list.add_task("Task1".to_string(), 10);
    task_list.add_task("Task2".to_string(), 5);

    if let Some(task) = task_list.consume_task() {
        println!("Consumed task: {:?}", task);
    }

    // Level 2: ファイルからタスクリストを読み込む例
    match TaskList::load_from_file("tasks.yaml") {
        Ok(loaded_task_list) => {
            println!("Loaded task list: {:?}", loaded_task_list);
        }
        Err(err) => {
            eprintln!("Error loading task list: {:?}", err);
        }
    }
}

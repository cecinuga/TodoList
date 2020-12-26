pragma solidity 0.5.0;
//pragma experimental ABIEncoderV2;

contract ToDo {
  uint lastTaskId;
  uint[] taskIds;
  struct Task{
    uint id;
    uint date;
    string content;
    string author;
    bool done;
  }
  mapping(uint => Task) tasks;
  event TaskCreated(uint, uint, string, string, bool);

  function _ToDo_() public {
    lastTaskId = 1;
  }

  function createTask(string memory _content, string memory _author) public {
    lastTaskId++;
    tasks[lastTaskId] = Task(lastTaskId, now, _content, _author, false);
    taskIds.push(lastTaskId);
    emit TaskCreated(lastTaskId, now, _content, _author, false);
  }

  function getTaskIds() public view returns(uint[] memory) {
    return taskIds;
  }

  function getTask(uint id) tasksExist(id) public view
    returns(
      uint,
      uint,
      string memory,
      string memory,
      bool
    ){

      return (
        tasks[id].id,
        tasks[id].date,
        tasks[id].content,
        tasks[id].author,
        tasks[id].done
      );
  }

  modifier tasksExist(uint id) {
    if(tasks[id].id == 0){
      revert();
    }
    _;
  }
}

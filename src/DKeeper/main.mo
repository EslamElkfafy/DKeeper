import List "mo:base/List";
import Debug "mo:base/Debug";

actor DKeeper {
  public type Note = {
    title: Text;
    content: Text;
  };

  var Notes: List.List<Note> = List.nil<Note>();

  public func createNote(titleText: Text, contentText: Text) {
    let newNote = {
      title = titleText;
      content = contentText;
    };

    Notes := List.push(newNote, Notes);
    Debug.print(debug_show (Notes));
  };

  public query func readNotes(): async [Note] {
    return List.toArray(Notes);
  };

  public func removeNote(id : Nat) {
    let tempList1 = List.take(Notes, id);
    let tempList2 = List.drop(Notes, id + 1);

    Notes := List.append(tempList1, tempList2);
    Debug.print("sdcsdcsdcsdc");

  };
}
// import Debug "mo:base/Debug";
import List "mo:base/List";
import D "mo:base/Debug";


actor DKepper {
  
  public type Note = {
    title: Text;
    content: Text;
  };

  stable var notes: List.List<Note> = List.nil<Note>();

  public query func readNotes() : async [Note] {
    return List.toArray( notes );
  };

  public func createNote( titleText: Text, contentText: Text ) {

    let newNote: Note = {
      title = titleText;
      content = contentText;
    };

    notes := List.push( newNote, notes );

    D.print( debug_show( notes ) );
  
  };

  public func removeNote( id: Nat ) {
   
   let listFront = List.take( notes, id );
   let listBack = List.drop( notes, id + 1 );

   notes := List.append( listFront, listBack );
  }

};

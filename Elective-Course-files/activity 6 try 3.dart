// PEC 02 ACTIVITY 6- OOP wit dart
// LIBRARY SYSTEM
// author - GEORGE GESITE, BSCPE -3A
import 'dart:io';

void main() {
  var book1 = new Books("Cracking the Coding Interview", "Gayle Laakmann",
      "Computer Science", 9780984782802);
  var book2 =
      new Books("Clean Code", "Rober Cecil", "Computer Science", 9780132350884);
  var book3 = new Books(
      "Code Complete", "Steve McConnell", "Computer Science", 9780735619678);
  var book4 =
      new Books("Nicomachean Ethics", "Aristotle", "Philosophy", 9780023895302);
  var book5 = new Books("A History of Western Philosophy", "Bertrand Russell",
      "Philosophy", 9780041000450);
  var book6 = new Books("Meditations on First Philosophy", "René Descartes",
      "Philosophy", 9780521481267);
  var book7 = new Books(
      "Atomic time", "Jonathan Binstock", "Pure Science", 9780886750725);
  var book8 = new Books("The politics of pure science", "Daniel Greenberg",
      "Pure Science", 9780226306322);
  var book9 = new Books("Wilding: The Return of Nature to a British Farm",
      "Isabella Tree", "Pure Science", 9781509805105);
  var book10 = new Books(
      "Van Richten's Guide to Ravenloft (Dungeons & Dragons, 5th Edition)",
      "Wizards RPG Team",
      "Art and Recreation",
      9780786967254);
  var book11 = new Books(
      "The Color Purple", " Alice Walker", "Art and Recreation", 9780151191536);
  var book12 = new Books(
      "Pop Out Around the World: Read, Build, and Play from New York to Beijing",
      "Pretend Friends, doupress labs",
      "Art and Recreation",
      9781950500994);
  var book13 = new Books("The Rise and Fall of the Third Reich",
      "William Shirer", "History", 9780330700016);
  var book14 = new Books("A People's History of the United States",
      "Howard Zinn", "History", 9780060148034);
  var book15 = new Books(
      "Philippine history", "Teodoro Agoncillo", "History", 9789718711064);

  var booksList = <Books>[]; //add all books to the master list
  booksList.add(book1);
  booksList.add(book2);
  booksList.add(book3);
  booksList.add(book4);
  booksList.add(book5);
  booksList.add(book6);
  booksList.add(book7);
  booksList.add(book8);
  booksList.add(book9);
  booksList.add(book10);
  booksList.add(book11);
  booksList.add(book12);
  booksList.add(book13);
  booksList.add(book14);
  booksList.add(book15);

  var lentbooksList = <LentBooks>[]; //list of lent books

  for (;;) {
    print("\nEnter number to select Option"); //imaginary ui for our program
    print("A = No. of Books");
    print("B = List of all Books");
    print("C = No. of Lent Books");
    print("D = Add a Book");
    print("E = Lend/Borrow a Book");
    print("F = Return a Book");
    print("EXIT = EXIT program");

    String? letter = stdin.readLineSync();
    letter = letter?.toUpperCase();
    switch (letter) {
      case "A": // print the number of books available in our system
        {
          print("--Number of books are: ");
          print(booksList.length);
        }
        break;
      case "B": //show all books in our system
        {
          for (int i = 0; i < booksList.length; i++) {
            print("${booksList[i].Title}");
          }
        }
        break;
      case "C": // show number of lent books
        {
          print("--No. of lent books are");
          print(lentbooksList.length);

          print("\n --Lent Books are: ");
          for (int x = 0; x < lentbooksList.length; x++) {
            print("${lentbooksList[x].Title}");
          }
        }
        break;
      case "D": //add more books (one by one)
        {
          int flag = 0;
          print("--Enter TITLE of new book: "); //ask for book title
          String? atitle = stdin.readLineSync();

          for (int i = 0; i < booksList.length; i++) {
            //CHECKS LIBRARY if book already exists
            if (atitle == booksList[i].Title) {
              flag = 1;
              break;
            }
          }
          if (flag == 1) {
            print("--Book already exists in the Library--");
          } else {
            //continues to ask for other book details; author, genre, isbn
            print("--Enter AUTHOR of new book");
            String? aauthor = stdin.readLineSync();
            print("--Enter GENRE of new book");
            String? agenre = stdin.readLineSync();
            print("--Enter ISBN(13 digits) of new book");
            int? aisbn = stdin.readByteSync();

            var newbook =
                new Books(atitle, aauthor, agenre, aisbn); // adds new book
            booksList.add(newbook); //add book to the master list

          }
        }
        break;
      case "E": //lend books
        {
          int flag = 0;
          print("--type book you wanna borrow: ");
          String? borrow = stdin.readLineSync();
          for (int i = 0; i < lentbooksList.length; i++) {
            if (borrow == lentbooksList[i].Title) flag = 1;
          }

          if (flag == 1) {
            print("---Book is already lent out---");
          } else {
            print("--Enter your name");
            String? user_name = stdin.readLineSync();
            print("--Enter your address");
            String? user_address = stdin.readLineSync();

            var u1 = User();
            u1.username = user_name;
            u1.useraddress = user_address;
            u1.bookborrowed = borrow;

            //transfer book from masterlist to booklentlist
            //search book from masterlist
            for (int i = 0; i < booksList.length; i++) {
              if (borrow == booksList[i].Title) {
                //copy
                var tbook = LentBooks(booksList[i].Title, booksList[i].Author,
                    booksList[i].Genre, booksList[i].isbn);
                lentbooksList.add(tbook);

                //remove from masterlist
                //therefore transfer
                booksList.removeAt(i);
                break;
              }
            }
            u1.disp();
            print(
                "\n --Thank you for borrowing the book, come again next time---");
          }
        }
        break;
      case "F": //return books
        {
          print("---Return Book:--- ");
          print("---Enter Book Title:--- ");
          String? returnbook = stdin.readLineSync();

          for (int i = 0; i < lentbooksList.length; i++) {
            if (returnbook == lentbooksList[i].Title) {
              var aReturnBook = Books(
                  lentbooksList[i].Title,
                  lentbooksList[i].Author,
                  lentbooksList[i].Genre,
                  lentbooksList[i].isbn);

              booksList.add(aReturnBook);

              lentbooksList.removeAt(i);
              print("---Thank you, book has been returned--- ");
            } else {
              print("Book title is wrong, or book already returned");
            }
          }
        }
        break;
      case "EXIT":
        {
          exit(1);
        }

      default:
        {
          print("---Invalid---");
        }
        break;
    }
  }
}

class Books {
  //class for the books
  String? Title;
  String? Author;
  String? Genre;
  int? isbn;

  Books(this.Title, this.Author, this.Genre, this.isbn);
}

class LentBooks {
  //class for lent books
  String? Title;
  String? Author;
  String? Genre;
  int? isbn;
  LentBooks(this.Title, this.Author, this.Genre, this.isbn);
}

class User {
  //info of person who will borrow books
  String? username;
  String? useraddress;
  String? bookborrowed;

  void disp() {
    print("\n---User Info---");
    print(username);
    print(useraddress);
    print("---Book borrowed---");
    print(bookborrowed);
  }
}

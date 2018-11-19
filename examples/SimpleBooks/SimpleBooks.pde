Table bookData;

ArrayList<Book> myFavoriteBooks;

void setup() {
	size(displayWidth, displayHeight);
	background(0);

	bookData = loadTable("books.csv", "header");
	myFavoriteBooks = new ArrayList<Book>();

	for (int i = 0; i < bookData.getRowCount(); i++) {
		TableRow currentRow = bookData.getRow(i);

		Book currentBook = new Book(
			currentRow.getString("authors"),
			currentRow.getString("original_title"),
			currentRow.getFloat("average_rating")
		);

		myFavoriteBooks.add(currentBook);
	}

}

void draw() {
	background(0);

	//int renderNumber = myFavoriteBooks.size(); // all of them
	int renderNumber = 100;
	
	for (int i = 0; i < renderNumber; i++) {
		Book theBook = myFavoriteBooks.get(i);

		theBook.display();
	}
}

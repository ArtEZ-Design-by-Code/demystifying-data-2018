ArrayList<Book> myFavoriteBooks;

void setup() {
	size(displayWidth, displayHeight);
	background(0);

	// Set the font
	PFont font = createFont("Montserrat-Regular.ttf", 15);
	textFont(font);

	// Load the mask
	PImage mask = loadImage("mask.png");

	// Load the data
	Table bookData = loadTable("books.csv", "header");
	myFavoriteBooks = new ArrayList<Book>();

	// How many books do we want to draw?
	int numberOfBooks = 200;
	int skip = 50; // Don't make this zero

	// Create the books
	for (int i = 0; i < numberOfBooks; i++) {
		TableRow currentRow = bookData.getRow(i * skip);

		String authors = currentRow.getString("authors");
		String title = currentRow.getString("original_title");
		String imageURL = currentRow.getString("image_url");
		float rating = currentRow.getFloat("average_rating");

		Book currentBook = new Book(authors, title, rating, imageURL, mask);

		myFavoriteBooks.add(currentBook);
	}

}

void draw() {
	background(0);

	for (int i = 0; i < myFavoriteBooks.size(); i++) {
		Book theBook = myFavoriteBooks.get(i);

		theBook.calculateHover();
		theBook.display();
	}
}

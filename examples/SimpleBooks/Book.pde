class Book {
	String authors;
	String title;
	float rating;
	float x;
	float y;

	Book(String inputAuthors, String inputTitle, float inputRating) {
		this.authors = inputAuthors;
		this.title = inputTitle;
		this.rating = inputRating;

		this.x = random(width);
		this.y = random(height);
	}

	void display() {
		fill(255);
		noStroke();
		ellipse(this.x, this.y, this.rating * 10, this.rating * 10);
		textAlign(CENTER);
		text(this.title , this.x, this.y + this.rating * 5 + 20);
	}
}

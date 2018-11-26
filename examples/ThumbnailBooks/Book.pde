class Book {
	PImage cover;

	String authors;
	String title;

	float rating;
	float x;
	float y;
	float size;

	boolean hovered;

	Book(String inputAuthors, String inputTitle, float inputRating, String imageURL, PImage mask) {
		println("Loading " + inputTitle);

		this.authors = inputAuthors;
		this.title = inputTitle;
		this.rating = inputRating;

		this.cover = this.createCover(imageURL, mask);

		this.x = random(width);
		this.y = random(height);
		this.size = pow(this.rating, 5) / 20;

		boolean foundAPlace = false;

		while (!foundAPlace) {
			boolean isOverlapping = false;

			for (int i=0; i<myFavoriteBooks.size(); i++) {
				Book otherBook = myFavoriteBooks.get(i);

				float distance = dist(this.x, this.y, otherBook.x, otherBook.y);

				if (distance < this.size / 2 + otherBook.size / 2) {
					isOverlapping = true;
					break;
				}
			}

			if (isOverlapping) {
				this.x = random(width);
				this.y = random(height);
			} else {
				foundAPlace = true;
			}
		}
	}

	PImage createCover(String url, PImage mask) {
		PImage downloadedImage = loadImage(url);

		int shortestSide = min(downloadedImage.width, downloadedImage.height);
		int cropX = downloadedImage.width / 2 - shortestSide / 2;
		int cropY = downloadedImage.height / 2 - shortestSide / 2;

		PImage croppedImage = downloadedImage.get(cropX, cropY, shortestSide, shortestSide);
		croppedImage.resize(64, 64);
		croppedImage.mask(mask);

		return croppedImage;
	}

	void calculateHover() {
		float distance = dist(this.x, this.y, mouseX, mouseY);

		if (distance < this.size / 2) {
			this.hovered = true;
		} else {
			this.hovered = false;
		}
	}

	void display() {
		fill(255);
		noStroke();

		imageMode(CENTER);

		textAlign(CENTER);

		if (hovered) {
			image(this.cover, this.x, this.y, 256, 256);
			text(this.title, this.x, this.y + 148);
		} else {
			image(this.cover, this.x, this.y, this.size, this.size);
		}
	}
}

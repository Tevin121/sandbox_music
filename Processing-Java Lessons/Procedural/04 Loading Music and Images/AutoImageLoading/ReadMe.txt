Create Double

Create Procedure for double

Might be printing the same files[] and it might not be erased

---

Example Image Code

PImage img;

void setup() {
  size(800, 600);

  // Load the image (place the image in the "data" folder)
  img = loadImage("example.jpg");

  // Get the dimensions
  int imgWidth = img.width;
  int imgHeight = img.height;

  println("Image Width: " + imgWidth);
  println("Image Height: " + imgHeight);
}

---

Work towards reading-writing string files in a folder
- deleting ones already read

---

public class DeleteFileExample {
    public static void main(String[] args) {
        File file = new File("example.txt");

        if (file.exists()) {
            boolean isDeleted = file.delete();
            if (isDeleted) {
                System.out.println("File deleted successfully.");
            } else {
                System.out.println("Failed to delete the file.");
            }
        } else {
            System.out.println("File does not exist.");
        }
    }
}

---
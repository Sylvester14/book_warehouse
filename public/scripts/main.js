let timer;
const delay = 5000;

const booksSelect = document.getElementById("books-select");
const authorsSelect = document.getElementById("authors-select");
const storesSelect = document.getElementById("stores-select");
const showcaseContainer = document.getElementById("showcase-container");
const timerSelect = document.getElementById("timer");

const selectAllButtons = document.querySelectorAll(
    ".filter-block__btn--select",
);
const clearButtons = document.querySelectorAll(".filter-block__btn--clear");

selectAllButtons.forEach((b) =>
    b.addEventListener("click", (event) => {
        const targetId = event.target.getAttribute("data-target");
        const targetSelect = document.getElementById(targetId);

        if (targetSelect) {
            Array.from(targetSelect.options).forEach((option) => {
                option.selected = true;
            });

            handleFilterChange();
        }
    }),
);

clearButtons.forEach((b) =>
    b.addEventListener("click", (event) => {
        const targetId = event.target.getAttribute("data-target");
        const targetSelect = document.getElementById(targetId);

        if (targetSelect) {
            Array.from(targetSelect.options).forEach((option) => {
                option.selected = false;
            });
        }

        handleFilterChange();
    }),
);

function getSelectedIds(selectElement) {
    return Array.from(selectElement.selectedOptions).map(
        (option) => option.value,
    );
}

function updateShowcase() {
    const activeBooks = getSelectedIds(booksSelect);
    const activeAuthors = getSelectedIds(authorsSelect);
    const activeStores = getSelectedIds(storesSelect);
    const emptyMessage = document.getElementById("empty-message");
    timerSelect.style.display = "none";

    function createCard(book) {
        const isActiveBook = activeBooks.includes(book.id.toString());

        const authors = book.authors
            .map(
                (a) =>
                    `<span class="${activeAuthors.includes(a.id.toString()) ? "highlighted" : ""}">${a.name}</span>`,
            )
            .join(", ");
        const stores = book.stores
            .map(
                (s) =>
                    `<span class="${activeStores.includes(s.id.toString()) ? "highlighted" : ""}">${s.name}</span>`,
            )
            .join(", ");

        const cardHtml = `
                    <div class='book-card'>
                        <div class='book-card__main'>
                            <div class='book-card__info'>
                                <h3 class='book-card__title ${isActiveBook ? "highlighted" : ""}'>${book.title}</h3>
                                <p class='book-card__meta'>${authors}</p>
                                <p class='book-card__meta'>${book.year}</p>
                                <p class='book-card__meta'>${stores}</p>
                            </div>
                        </div>
                    </div>`;

        return cardHtml;
    }

    if (
        activeBooks.length === 0 &&
        authorsSelect.length === 0 &&
        activeStores.length === 0
    ) {
        showcaseContainer.innerHTML = "<p>Витрина пуста</p>";
        return;
    }

    const queryParams = new URLSearchParams();
    activeBooks.forEach((id) => queryParams.append("books[]", id));
    activeAuthors.forEach((id) => queryParams.append("authors[]", id));
    activeStores.forEach((id) => queryParams.append("stores[]", id));

    fetch("/api/showcase?" + queryParams.toString())
        .then((response) => response.json())
        .then((books) => {
            showcaseContainer.innerHTML = "";
            emptyMessage.style.display = "none";

            if (books.length === 0) {
                emptyMessage.style.display = "block";
                return;
            }

            books.forEach((book) => {
                showcaseContainer.insertAdjacentHTML(
                    "beforeend",
                    createCard(book),
                );
            });
        });
}

function handleFilterChange() {
    timerSelect.style.display = "inline";
    clearTimeout(timer);
    timer = setTimeout(updateShowcase, delay);
}

[booksSelect, authorsSelect, storesSelect].forEach((select) => {
    select.addEventListener("change", handleFilterChange);
});

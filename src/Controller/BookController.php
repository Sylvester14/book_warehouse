<?php

namespace App\Controller;

use App\Repository\AuthorRepository;
use App\Repository\BookRepository;
use App\Repository\StoreRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;

final class BookController extends AbstractController
{
    #[Route('/', name: 'app_book')]
    public function index(BookRepository $bookRepository, AuthorRepository $authorRepository, StoreRepository $storeRepository): Response
    {
        $books = $bookRepository->findAll();
        $authors = $authorRepository->findAll();
        $stores = $storeRepository->findAll();

        return $this->render('book/index.html.twig', [
            'books' => $books,
            'authors' => $authors,
            'stores' => $stores
        ]);
    }

    #[Route('/api/showcase', name: 'api_showcase', methods: ['GET'])]
    public function getShowcase(Request $request, BookRepository $bookRepository): JsonResponse
    {
        $selectedBooks = $request->query->all('books');
        $selectedAuthors = $request->query->all('authors');
        $selectedStores = $request->query->all('stores');

        if (empty($selectedBooks) && empty($selectedAuthors) && empty($selectedStores)) {
            return new JsonResponse([]);
        }

        $books = $bookRepository->findBooksForShowcase($selectedBooks, $selectedAuthors, $selectedStores);

        $result = [];

        foreach ($books as $book) {
            $result[] = [
                'id' => $book->getId(),
                'title' => $book->getTitle(),
                'year' => $book->getYear(),
                'authors' => array_map(fn($a) => ["id" => $a->getId(), "name" => $a->getName()], $book->getAuthors()->toArray()),
                'stores' => array_map(fn($s) => ["id" => $s->getId(), "name" => $s->getName()], $book->getStores()->toArray()),
            ];
        }

        return new JsonResponse($result);
    }
}

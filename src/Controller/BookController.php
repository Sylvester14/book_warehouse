<?php

namespace App\Controller;

use App\Repository\BookRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;

final class BookController extends AbstractController
{
    #[Route('/', name: 'app_book')]
    public function index(): Response
    {
        return $this->render('book/index.html.twig', [
            'controller_name' => 'BookController',
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
                'authorIds' => array_map(fn($a) => $a->getId(), $book->getAuthors()->toArray()),
                'storeIds' => array_map(fn($s) => $s->getId(), $book->getStores()->toArray()),
            ];
        }

        return new JsonResponse($result);
    }
}

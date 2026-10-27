<?php

namespace App\Factory;

use App\Entity\Book;
use Zenstruck\Foundry\Persistence\PersistentObjectFactory;

/**
 * @extends PersistentObjectFactory<Book>
 */
final class BookFactory extends PersistentObjectFactory
{
    /**
     * @see https://symfony.com/bundles/ZenstruckFoundryBundle/current/index.html#factories-as-services
     *
     * @todo inject services if required
     */
    public function __construct() {}

    #[\Override]
    public static function class(): string
    {
        return Book::class;
    }

    /**
     * @see https://symfony.com/bundles/ZenstruckFoundryBundle/current/index.html#model-factories
     *
     * @todo add your default values here
     */
    #[\Override]
    protected function defaults(): array|callable
    {
        return [
            'title' => self::faker()->catchPhrase(),
            'year' => self::faker()->numberBetween(1990, 2026),
            'authors' => [],
            'stores' => []
        ];
    }

    /**
     * @see https://symfony.com/bundles/ZenstruckFoundryBundle/current/index.html#initialization
     */
    #[\Override]
    protected function initialize(): static
    {
        return $this
            ->afterInstantiate(function (Book $book): void {
                $randomAuthors = AuthorFactory::randomSet(self::faker()->numberBetween(1, 3));
                foreach ($randomAuthors as $author) {
                    $book->addAuthor($author);
                }

                $randomStores = StoreFactory::randomSet(self::faker()->numberBetween(1, 4));
                foreach ($randomStores as $store) {
                    $book->addStore($store);
                }
            });
    }
}

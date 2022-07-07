<?php

namespace Tests\Integration;

use Illuminate\Foundation\Testing\RefreshDatabase;
use Tests\TestCase;

class FakeApiTest extends TestCase
{
    /**
     * A basic test example.
     *
     * @return void
     */
    public function test_the_fake_api_returns_a_successful_response()
    {
        $url = "http://".config('workshop.fake_api')."/api/zip/87110";
        $response = $this->get($url);

        $response->assertStatus(200);
    }
}

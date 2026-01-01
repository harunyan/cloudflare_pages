export default {
    async fetch(request, env, ctx) {
        return new Response('placeholder worker for workers-site', {
            status: 200,
            headers: { 'content-type': 'text/plain; charset=utf-8' }
        });
    }
}
